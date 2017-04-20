clear all
close all
clc

load('/Users/AnjaliDhobale/Google Drive/Research/MendeleyDataUpload/ut_d5_40hz_14left.mat');

x = dc4left14(1,:);
y = awgn(x,0.00000000075,'measured');
data_image1 = [x;y];

% plot([x y])
% legend('Original Signal','Signal with AWGN')
% 
W=[data_image1'];
CorrM=corr(W);
figure(1);
imagesc(CorrM);
m = title('Pearson Cross-correlation Matrix for Bidirectional Micro-TENN'); colorbar;
set(m,'FontSize',16);
set(gca,'FontSize',16);