clear all;
close all;
load('S1 Data and Code/taxels details/taxPosArtSkin20x20.mat')
load('S4 Data and Code/simulated skin/generate_fig/Mtest241016.mat')

stimulus=Mtest(5,:);
thr=0.001;
nonzero=find(stimulus>thr);
zero=find(not(stimulus>thr));
stem3(TaxPos(1,nonzero),TaxPos(2,nonzero),stimulus(nonzero),'.')
hold on
stem3(TaxPos(1,zero),TaxPos(2,zero),stimulus(zero),'.c')

print('S4 Data and Code/simulated skin/generate_fig/stimulus_sim_example','-depsc2')

