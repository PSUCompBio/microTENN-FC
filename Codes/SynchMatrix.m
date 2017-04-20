%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This code calculated the pearson crosscorrelation, phase
%synchronization and Power Spectrum for the dataset obtained from FluoroSNNAP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc

%loading dataset extracted from FluoroSNNAP
load ut_d5_40hz_14left
data_image1 = dc4left14;
[N,T] = size(data_image1);

%Calculating the Pearson Crosscorrelation 
W=[data_image1'];
CorrM=corr(W);
figure(1);
imagesc(CorrM);
m = title('Pearson Cross-correlation Matrix for Bidirectional Micro-TENN'); colorbar;
set(m,'FontSize',16);
set(gca,'FontSize',16);


%Calculating Peason Crosscorrelation
%Refer Allefeld, C., Müller, M. & Kurths, J. Eigenvalue Decomposition As a Generalized Synchronization Cluster Analysis. Int. J. Bifurc. Chaos 17, 3493?3497 (2007)
 for ii=1:N
y = hilbert(W(:,ii));
sigphase = angle(y);
PhMat(:,ii)= sigphase;
 end
SigLength=size(PhMat,1);
for jj=1:N
for kk=1:N
RS(jj,kk)=abs(sum(exp(i*(PhMat(:,jj)-PhMat(:,kk))))/SigLength);
end
end
%RS = RS/max(RS);
RS = RS/max(abs(RS(:)));
figure(2);
imagesc(RS);
t = title('Phase Synchronization Matrix for Bidirectional Micro-TENN'); colorbar;
set(t,'FontSize',16)
set(gca,'FontSize',16);


%Selecting rows of data that are not correlated and not synchronized
%Similar signals cause DTF signals to fail, following algorithm is used to
%eliminate similar signals 
indx = [];
for i = 1:N;
    %SORT
    IC2 = find(CorrM(:,1)>=0.5);
    IP2 = find(RS(:,1)>=0.5);
    a = [indx,intersect(IC2,IP2)'];
    b = unique(a);
    indx = b(2:end);
end
newind = ones(1,N);
newind(indx) = 0;
c = (newind>0);
data_image2 = data_image1(c,:);

%Power Spectra Curve
C = dc4left14;
s1 = C(28,:);
%40Hz Timeline
t=0:0.025:99.99;
%t=0:0.008771:35.08;
%t = 0:0.05:119.950;
p = spline(t,s1,3);

%Fs = 114;
Fs = 40;
N = length(t);
xdft = fft(s1);

xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
%psdx(ii,:)=psdx(2:end-1);
freq = 0:Fs/length(s1):Fs/2;
%freq(ii,:) = 0:Fs/length(s1):Fs/2;
%end

figure(3)
plot(freq,10*log10(psdx))
grid on
title('Periodogram Using FFT','FontSize',20)
xlabel('Frequency (Hz)','FontSize',20)
ylabel('Power/Frequency (dB/Hz)','FontSize',20)
set(gca,'FontSize',16);


    
    
