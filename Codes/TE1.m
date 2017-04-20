%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This MATLAB code calculates the Transfer Entropy matrix using the JIDT toolbox

%%Add your path to JIDT folder and calcium signal dataset
%%Change line 27-30, to change the window being fitted for TE signals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear,clc
javaaddpath('/Users/AnjaliDhobale/Google Drive/Research/TransferEntropy/infodynamics-dist-1.3.1/infodynamics.jar');
load('/Users/AnjaliDhobale/Google Drive/Research/ut_d5_40hz_14left.mat');
Data=dc4left14;
NS=size(Data,1);
NO=size(Data,2);
% Generate some random normalised data.
numObservations = NO;
TEM=zeros(NS,NS);


covariance=0.4;


for ii=1:NS
    for jj=1:NS
        sourceArray=Data(ii,100:800);
        destArray=Data(jj,100:800);
 


% Create a TE calculator and run it:
teCalc=javaObject('infodynamics.measures.continuous.kernel.TransferEntropyCalculatorKernel');
teCalc.setProperty('NORMALISE', 'true'); % Normalise the individual variables
teCalc.initialise(1, 0.5); % Use history length 1 (Schreiber k=1), kernel width of 0.5 normalised units
teCalc.setObservations(sourceArray, destArray);
% For copied source, should give something close to expected value for correlated Gaussians:
result = teCalc.computeAverageLocalOfObservations();
fprintf('TE result %.4f bits; expected to be close to %.4f bits for these correlated Gaussians but biased upwards\n', ...
    result, log(1/(1-covariance^2))/log(2));
TEM(ii,jj)=result;

    end
end
imagesc(TEM/max(TEM(:))), colorbar
 title('Transfer Entropy Connectivity Matrix ','FontSize',22);
xlabel('ROI ID','FontSize',22);
ylabel('ROI ID','FontSize',22);
ax = gca;
 ax.FontSize = 16;
% imagesc(TEM), colorbar
