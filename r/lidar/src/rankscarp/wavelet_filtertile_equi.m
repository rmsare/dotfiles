function [A, KT, ANG, SNR] = wavelet_filtertile_equi(dem, d, logkt_max, ang_step)

%% Applies wavelet filter to DEM, returning best-fit parameters at each grid
%% point 
%% George Hilley 2010
%% Minor revisions Robert Sare June 2015
%%
%% INPUT:       dem - dem grid struct
%%              d - length of template scarp in out-of-plane direction
%%              logkt_max - maximum log10(kt) for grid search
%%
%% OUTPUT:      bestA - best-fit scarp amplitudes
%%              bestKT - best-fit morphologic ages
%%              bestANG - best-fit strikes
%%              bestSNR - signal-to-noise ration for best-fit A and error

% Scarp-face fraction, noise level, template length 
frac = 0.9;
sig = 0.1;

if (nargin < 2)
    d = 200;
    kt_lim = 3.5;
    kt_step = 0.1;
    ang_step = 1;
end


% Grid search over orientation and ages
kt_lim = logkt_max/sqrt(2);
kt_step = kt_lim/25;
ANG = -90:ang_step:90;
LOGKT = 0:kt_step:kt_lim;

de = dem.de;
M = dem.grid;
bestSNR = zeros(size(M));
bestA = zeros(size(M));
bestKT = zeros(size(M));
bestANG = -9999.*ones(size(M));

% Grid search
for(i=1:length(LOGKT))
    thiskt = 10.^LOGKT(i);
    for(j=1:length(ANG))
        thisang = ANG(j);
        
        % Compute wavelet parameters for this orientation and morphologic age
        [thisSNR,thisA,thiserr] = calcerror_mat_xcurv(frac,d,thisang,thiskt,de,M);
        k = find(isnan(thisSNR));
        thisSNR(k) = 0;
        
        % Retain parameters with maximum SNR 
        bestA = (bestSNR < thisSNR).*thisA + (bestSNR >= thisSNR).*bestA;
        bestKT = (bestSNR < thisSNR).*thiskt + (bestSNR >= thisSNR).*bestKT;
        bestANG = (bestSNR < thisSNR).*thisang + (bestSNR >= thisSNR).*bestANG;
        bestSNR = (bestSNR < thisSNR).*thisSNR + (bestSNR >= thisSNR).*bestSNR;
        
        % Progress report
        fprintf('%6.2f%%\n',(((i-1)*length(ANG) + j)./(prod([length(ANG),length(LOGKT)])))*100);
                
    end
end

A = dem;
KT = dem;
ANG = dem;
SNR = dem;

A.grid = bestA;
KT.grid = bestKT;
ANG.grid = bestANG;
SNR.grid = bestSNR;

end
