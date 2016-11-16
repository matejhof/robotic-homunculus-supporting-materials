clear all;
close all;
load('S4 Data and Code/torso/generate_fig/torso1exper1thumbACutContDev2.mat')
load('S2 Data and Code/taxels details/TorsoTaxPosCut.mat')


stimulus=TrainTorso1expAContDev2(4000,:);
thr=0.05;
nonzero=find(stimulus>thr);
zero=find(not(stimulus>thr));
stem3(TorsoTaxPosCut(1,nonzero),TorsoTaxPosCut(2,nonzero),stimulus(nonzero),'.')
xlim([-90 90])
ylim([-70 110])
hold on
stem3(TorsoTaxPosCut(1,zero),TorsoTaxPosCut(2,zero),stimulus(zero),'.c')
view(15,40)
print('S4 Data and Code/torso/generate_fig/stimulus_torso_example.eps','-depsc2')
