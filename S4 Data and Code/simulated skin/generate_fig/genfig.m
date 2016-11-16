clear all; close all;
addpath('S2 Code/somtoolbox05m2809')
addpath('S1 Code')
load('S1 Data and Code/taxels details/taxPosArtSkin20x20.mat')


% continuous 
load('S4 Data and Code/simulated skin/learned SOMs/241016ASp3o01.mat')
load('S4 Data and Code/simulated skin/generate_fig/Mtest241016.mat')
h1=vizuRF3AdGaps(sM,TaxPos,Mtest,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1],'thresh',10);
print('S4 Data and Code/simulated skin/generate_fig/SOM_cont_example','-depsc2')


% binary
load('S1 Data and Code/learned SOMs/2210p8o01.mat')
% MtestBin=createTouches2(20,20,10000,1);
% save('S4 Data and Code/simulated skin/generate_fig/MtestBin','MtestBin')
load('S4 Data and Code/simulated skin/generate_fig/MtestBin')
h2=vizuRF3AdGaps(sM,TaxPos,MtestBin,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1],'thresh',10);
print('S4 Data and Code/simulated skin/generate_fig/SOM_bin_example','-depsc2')




