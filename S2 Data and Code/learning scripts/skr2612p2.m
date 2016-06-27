load('torso1exper1thumbDCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 MRF=zeros(o*p,440);
  MRF(1:32,[1:100,101:110,121:160,161:180,371:390,261:280,241:260,211:230,    427:430,391:395,111:115,317:320,281:285,231:234])=1;
  MRF(33:64,[341:440,101:120,261:280,221:240,201:210,301:340,181:200,281:300   31:33,35,67:70,64,131:134,140,128:130,121,245:247,243:244,215:217,214])=1;
  

 sMname=['2612p2o1';'2612p2o2';'2612p2o3';'2612p2o4';'2612p2o5'];
sD=som_data_struct(TrainTorso1expD);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end

------

load('torso1exper1thumbDCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
 
 MRF=zeros(o*p,440);
  MRF(1:32,[1:100,101:110,121:160,161:180,371:390,261:280,241:260,211:230,    427:430,391:395,111:115,317:320,281:285,231:234])=1;
  MRF(33:64,[341:440,101:120,261:280,221:240,201:210,301:340,181:200,281:300   31:33,35,67:70,64,131:134,140,128:130,121,245:247,243:244,215:217,214])=1;
  

 sMname=['2612p2o6';'2612p2o7';'2612p2o8';'2612p2o9';'2612p2o0'];
sD=som_data_struct(TrainTorso1expD);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end

