%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This MATLAB code displays the nDTF plots obtained from the EEGLAB data file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load EEGLAB datafile
nDTF4 = EEG.CAT.Conn.nDTF;

GGCm = nDTF4;

%%Seperating the DTF matrices by frequency
%%Third dimension is Frequency in Hz
GGCm1 = GGCm(:,:,1);
GGCm2 = GGCm(:,:,2);
GGCm3 = GGCm(:,:,3);
GGCm4 = GGCm(:,:,4);
GGCm5 = GGCm(:,:,5);
GGCm6 = GGCm(:,:,9);
GGCm7 = GGCm(:,:,12);
GGCm8 = GGCm(:,:,15);
GGCm9 = GGCm(:,:,19);

%%display subplots
subplot(331)
imagesc(GGCm1);colorbar
title('1 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(332)
imagesc(GGCm2);colorbar
title('2 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(333)
imagesc(GGCm3);colorbar
title('3 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(334)
imagesc(GGCm4);colorbar
title('4 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(335)
imagesc(GGCm5);colorbar
title('5 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(336)
imagesc(GGCm6);colorbar
title('9 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(337)
imagesc(GGCm7);colorbar
title('12 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(338)
imagesc(GGCm8);colorbar
title('15 Hz','FontSize',16)
set(gca,'FontSize',16)
subplot(339)
imagesc(GGCm9);colorbar
title('19 Hz','FontSize',16)
set(gca,'FontSize',16)
% subplot(4,3,11)
% imagesc(GGCm10);colorbar
% title('Added Frequencies 1-9Hz')

