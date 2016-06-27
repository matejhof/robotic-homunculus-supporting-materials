load('torso1exper1thumbDCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 RF=ones(o*p,440);
  

 sMname=['1812p12o1';'1812p12o2';'1812p12o3';'1812p12o4';'1812p12o5'];
sD=som_data_struct(TrainTorso1expD);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end

--------

load('torso1exper1thumbDCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 RF=ones(o*p,440);
  

 sMname=['1812p12o6';'1812p12o7';'1812p12o8';'1812p12o9';'1812p12o0'];
sD=som_data_struct(TrainTorso1expD);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end
