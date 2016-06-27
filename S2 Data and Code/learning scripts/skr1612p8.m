load('torso2exper2thumbsBCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 RF=ones(o*p,440);
  

 sMname=['1612p8o1';'1612p8o2';'1612p8o3';'1612p8o4';'1612p8o5'];
sD=som_data_struct(TrainTorso2expB);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end

-------

load('torso2exper2thumbsBCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 RF=ones(o*p,440);
  

 sMname=['1612p8o6';'1612p8o7';'1612p8o8';'1612p8o9';'1612p8o0'];
sD=som_data_struct(TrainTorso2expB);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end

