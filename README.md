# microTENN-FC
MicroTENN Functional Connectivity Codes

Documentation for MicroTENN Functional Analysis

Visualizing Calcium Imaging Activity from .tiff stack using FluoroSNNAP
1.	In the MATLAB workspace, “playTIFFstack.m” script can be used to play the .tiff stack and visualize the calcium activity in video player.
2.	Example “fnc_9div_50ms.tiff” is Micro-TENN Sample tiff stack has been provided to visualize calcium activity

Extracting Calcium Imaging Signals from .tiff stack using FluoroSNNAP

1.	Download the calcium image analysis software source code FluoroSNNAP from  http://www.seas.upenn.edu/~molneuro/fluorosnnap.html  and unzip the FluoroSNNAP.zip package and navigate to FluoroSNNAP folder in MATLAB.  
2.	Place each single .tif image in a unique folder in your project directory. This allows space to allow FluoroSNNAP to save the output in the same folder.
3.	The .tiff stack contains time lapse images of the calcium synchronization activity of the Microtenns. To capture both neuronal aggregates of the microTENNs and perform image segmentation, the images are divided into “left” and “right” sections.
4.	In MATLAB work environment, load FluoroSNNAP folder to the working directory. Type “FluoroSNNAP” in the command line to open the user interface. 
5.	Click on “Open folder containing TIFF stack” and load the .tif stack. From the GUI toolbar, click on “Preprocessing”→“Segmentation GUI”→”Time Averaged Image”.
6.	In the Segmentation GUI window, select Tools→”Set Radius” →enter 5px radius to manually select ROIs→Freehand. Close window and manually select the ROIs from the time averaged image. The selected ROIs will pop up on the left side of the window. Save the segmentation by clicking File and save as. This segmentation file will be saved in your folder directory.
7.	Click on Analysis and select “Preferences”. Enter the data acquisition frame rate and also select which analysis modules preferred. Computation time will increase if all the features are checked. To extract signal, we only need to baseline fluorescence to be converted to deltaF/F. Once the analysis is complete, the results are saved in the same folder. 
8.	The FluoroSNNAP calcium dataset can be found in the analysis-baseline.mat and contains all single-cell and network level analysis. Load this file and you should have a “data” variable in your workspace.   Repeat the same steps for the other side and combine the two .mat files containing both left and right signals
9.	The example dataset ‘ut_d5_40hz_14left.mat’ contains all calcium signals data for the micro-TENN 5 DIV at 40Hz and the first 14 rows contains data from the left aggregates. 
 

Crosscorrelation, Phase Synchronization and Power Spectrum Analysis

1.	The script “SynchMatrix.m” can be used to obtain the Crosscorrelation, phase synchronization matrices and power spectral matrices for the calcium signal dataset. Simply load your dataset. 
2.	For Power Spectral matrices, the total time(ms) and time taken to capture each frame(ms) must be recorded for the “t” variable. This will represent the time on the x-axis for the dataset. 

Estimating the Directed Transfer Function Matrices using EEGLAB software

1.	Download the EEGLAB_13 folder containing the SIFT plugin from the  Github directory. This software is compatible with MATLAB 2012a or 2013b version available on the Hammer PSU system  and load the EEGLAB directory to MATLAB workspace.  Additional detailed sources is available at: https://sccn.ucsd.edu/wiki/EEGLAB 
2.	Type “EEGLAB” in the command line to load the graphical user interface. Load the ‘ut_d5_40hz_14left.mat’ dataset and define the data acquisition parameters. Once the data has been loaded, it is ready to be processed. 
3.	SIFT can be started from the Tools   SIFT menu. The sub-menu options correspond to SIFT’s four main modules we used: Pre-Processing, Model Fitting, Validation and Connectivity. Complete each of these modules to fit the MVAR model on the dataset and calculate the NDTF connectivity matrices.
4.	Once the SIFT processing is complete, save the workspace. An example workspace “mvari4.mat” is available for convenience. Run the “PostEEGLABProcessing.m” script to get a neat visual of the nDTF matrices. The nDTF matrices can be found in  EEG.CAT.Conn.nDTF subfolder of the MATLAB workspace. 
5.	The script “PostStatistics.m” can be used to obtain the PDF distribution of the nDTF matrices and conduct the Kolmogorov-Smirnoff Test between the nDTF of different micro-tenn images. Example of four nDTF datasets are available in the Github directory. 

Estimating Transfer Entropy Matrices using JIDT software

1.	For convenience, download JIDT toolbox to estimate Transfer Entropy (TE) matrices from the  Github directory. It can also be downloaded from the original JIDT github directory from: https://github.com/jlizier/jidt/wiki/OctaveMatlabExamples.  
2.	The script “TEC1.m” is used to calculate the TE matrices for the ‘ut_d5_40hz_14left.mat’. Simply load the file and define the time slot window by frame to calculate the TE matrix. 


