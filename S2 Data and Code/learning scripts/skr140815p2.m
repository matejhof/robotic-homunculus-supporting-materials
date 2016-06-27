load('torso2exper2thumbsBCut.mat')
addpath ('somtoolbox05m2809');
 o=8;  %map size
  p=8; 
 pocTrEp=25; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final


MRF=zeros(o*p,440);
MRF([1:4,9:12,17:20,25:28],[1:80,371:400,421:430,101:180,261:270,311:320])=1;
MRF([33:36,41:44,49:52,57:60],[31:40,61:70,101:140,181:210,261:270,301:320,341:440])=1;
MRF([5:8,13:16,21:24,29:32],[71:180,211:290,311:320])=1;
MRF([37:40,45:48,53:56,61:64],[101:140,181:250,261:340,361:370])=1;

 sMname=['140815p2o1';'140815p2o2';'140815p2o3';'140815p2o4';'140815p2o5';'140815p2o6';'140815p2o7';'140815p2o8';'140815p2o9';'140815p2o0'];
sD=som_data_struct(TrainTorso2expB);
  
for k=1:1:size(sMname,1)
  
  
 
 
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end