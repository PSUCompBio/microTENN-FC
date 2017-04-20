%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This code displays calculates the PDF distribution of the nDTF matrices
%and the Kolmogorov Smirnoff Tests between the nDTF datasets of four
%micro-tenns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear all ; clc; close all

load('nDTF1.mat');n1 = nDTF2;
load('nDTF2.mat');n2 = nDTF2;
load('nDTF3.mat');n3 = nDTF2;
load('nDTF4.mat');n4 = nDTF2;


n1m=n1(:,:,1); n1m = double(n1m(:));
%histfit(n1m)
n2m=n2(:,:,1); n2m = double(n2m(:));
%histfit(n2m)
n3m=n3(:,:,1); n3m = double(n3m(:));
%histfit(n3m)
n4m=n4(:,:,1); n4m = double(n4m(:));
%histfit(n4m)


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
 ktest12 = kstest2(n1m,n2m,'Alpha',0.03);
 ktest13 = kstest2(n1m,n3m,'Alpha',0.55);
 ktest14 = kstest2(n1m,n4m,'Alpha',0.03);
 ktest23 = kstest2(n2m,n3m,'Alpha',0.03);
 ktest24 = kstest2(n2m,n4m,'Alpha',0.03);
 ktest34 = kstest2(n3m,n4m,'Alpha',0.03);
