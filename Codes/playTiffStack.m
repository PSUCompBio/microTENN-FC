%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Anjali Dhobale afd5230@psu.edu
%Refer Paper: Accesssing the Functional Connectivity of Micro-Tisse
%Engineered Neural Networks using Calcium Fluorescence Signals
%This code can be used to play a movie of the acquired .tiff stack 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



info = imfinfo('fnc_9div_50ms.tif');

for i = 1:length(info)
    
    K(:,:,:,i)=imread('fnc_9div_50ms.tif');
end

implay(K)