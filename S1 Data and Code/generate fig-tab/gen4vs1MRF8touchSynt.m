addpath 'somtoolbox05m2809'
load('taxPosArtSkin20x20.mat') % from folder taxels details
load('sMTabmeasureValues.mat')
load('2610p2o06.mat') %folder learned SOMs

%add to path 'S1 Code' folder
h1=vizuRF3AdGaps(sM,TaxPos,Mtest,'gap',[0.025 0.0025],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1]);
s1=suptitle('1 MRF');
set(s1,'FontSize',24,'FontWeight','normal')
 measure2(sM,TaxPos,Mtest)


load('110815p10o03.mat')
h2=vizuRF3AdGaps(sM,TaxPos,Mtest,'gap',[0.025 0.0025],'marg_w',[0.15 0.15],'marg_h',[0.1 0.1]);
s2=suptitle('4 MRF');
set(s2,'FontSize',24,'FontWeight','normal')

 measure2(sM,TaxPos,Mtest)


