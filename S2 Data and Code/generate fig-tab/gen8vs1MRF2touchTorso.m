addpath('somtoolbox05m2809')
load('torso1exper1thumbACut') % from folder train set
load('TorsoTaxPosCut') % from folder taxels details


Mtest=TrainTorso1expA(1:10000,:);

load('1612p8o5.mat') %folder learned SOMs

%add to path 'S1 Code' folder
h1=vizuRF3AdGaps(sM,TorsoTaxPosCut,Mtest,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1]);
s1=suptitle('1 MRF');
set(s1,'FontSize',24,'FontWeight','normal')
measure2(sM,TorsoTaxPosCut,Mtest)




load('140815p4o0.mat')
h2=vizuRF3AdGaps(sM,TorsoTaxPosCut,Mtest,'gap',[0.015 0.001],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1]);
s2=suptitle('8 MRF');
set(s2,'FontSize',24,'FontWeight','normal')
measure2(sM,TorsoTaxPosCut,Mtest)





