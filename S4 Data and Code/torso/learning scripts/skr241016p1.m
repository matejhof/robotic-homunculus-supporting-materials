load('torso1exper1thumbDCutContDev2.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 RF=ones(o*p,440);
  

 sMname=['241016p1o0';'241016p1o1';'241016p1o2';'241016p1o3';'241016p1o4';'241016p1o5';'241016p1o6';'241016p1o7';'241016p1o8';'241016p1o9'];
sD=som_data_struct(TrainTorso1expDContDev2);
  
for k=1:1:size(sMname,1)
   
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end
