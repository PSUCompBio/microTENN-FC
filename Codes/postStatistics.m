%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This MATLAB code displays calculates the PDF distribution of the nDTF matrices
%and the Kolmogorov Smirnoff Tests between the nDTF datasets of four
%micro-tenns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear all ; clc; close all

%%load sample DTF datasets to compare distributions from four different images
load('nDTF1.mat');n1 = nDTF2;
load('nDTF2.mat');n2 = nDTF2;
load('nDTF3.mat');n3 = nDTF2;
load('nDTF4.mat');n4 = nDTF2;

%%The third dimension of nDTF is frequency
%%Here we analyze DTF matrix at 1Hz frequency and convert the matrix from single to double.
n1m=n1(:,:,1); n1m = double(n1m(:));
n2m=n2(:,:,1); n2m = double(n2m(:));
n3m=n3(:,:,1); n3m = double(n3m(:));
n4m=n4(:,:,1); n4m = double(n4m(:));

%%Calculating the Probability Distribution Function Plot for the nDTF matrices.
% histfit
 h = hist(n1m,50,'kernel');
 h = h/sum(h); 
 xlim([0 55]);
 %axis([0,55,0,0.4])
 bar(h);
 title('nDTF PDF Distribution @1Hz ','FontSize',22);
xlabel('nDTF values','FontSize',22);
ylabel('Probability','FontSize',22);
ax = gca;
 ax.FontSize = 16;
 
 
 %Kolmogorov Smirnoff Test
 %%This test is used to test if the distribution of the following datasets are from the same distribution.
 %%if answer =1, then both the datasets belong from the same distribution
 %% if answer = 0, both datasets are NOT from the same distribution
 ktest12 = kstest2(n1m,n2m,'Alpha',0.03);
 ktest13 = kstest2(n1m,n3m,'Alpha',0.55);
 ktest14 = kstest2(n1m,n4m,'Alpha',0.03);
 ktest23 = kstest2(n2m,n3m,'Alpha',0.03);
 ktest24 = kstest2(n2m,n4m,'Alpha',0.03);
 ktest34 = kstest2(n3m,n4m,'Alpha',0.03);
