clear all;
 close all;
addpath('S2 Code/somtoolbox05m2809')

addpath('S1 Code')
load('S2 Data and Code/taxels details/TorsoTaxPosCut.mat')

% cont
load('torso1exper1thumbACutContDev2.mat')

MtestCont=TrainTorso1expAContDev2;
MtestCont=MtestCont(1:10000,:);

load('S4 Data and Code/torso/learned SOMs/241016p1o2.mat')
h1=vizuRF3AdGaps(sM,TorsoTaxPosCut,MtestCont,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1],'thresh',6);
print('S4 Data and Code/torso/generate_fig/SOM_cont_torso_example','-depsc2')


% bin
load('S2 Data and Code/train set/torso1exper1thumbACut.mat')
MtestBin=TrainTorso1expA;
MtestBin=MtestBin(1:10000,:);

load('S2 Data and Code/learned SOMs/1812p12o6.mat')
h2=vizuRF3AdGaps(sM,TorsoTaxPosCut,MtestBin,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1],'thresh',10);
print('S4 Data and Code/torso/generate_fig/SOM_bin_torso_example','-depsc2')

