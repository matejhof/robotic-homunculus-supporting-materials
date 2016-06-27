addpath ('somtoolbox05m2809');

  m=20; %skin size m-y, n-x
  n=20;
  o=8;  %map size
  p=8;
  pocTrDot=100000; %number of training touches
  dotykPst=1;  
  pocTrEp=24; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
  
  MRF=zeros(o*p,m*n);
  MRF([1:4,9:12,17:20,25:28],[181:191,201:211,221:231,241:251,261:271,281:291,301:311,321:331,341:351,361:371,381:391])=1;
  MRF([5:8,13:16,21:24,29:32],[1:11,21:31,41:51,61:71,81:91,101:111,121:131,141:151,161:171,181:191,201:211])=1;
  MRF([33:36,41:44,49:52,57:60],[190:200,210:220,230:240,250:260,270:280,290:300,310:320,330:340,350:360,370:380,390:400])=1;
  MRF([37:40,45:48,53:56,61:64],[10:20,30:40,50:60,70:80,90:100,110:120,130:140,150:160,170:180,190:200,210:220])=1;


  sMname=['110815p8o01';'110815p8o02';'110815p8o03';'110815p8o04';'110815p8o05';'110815p8o06';'110815p8o07';'110815p8o08';'110815p8o09';'110815p8o10'];

  sDname=['110815p8o01sD';'110815p8o02sD';'110815p8o03sD';'110815p8o04sD';'110815p8o05sD';'110815p8o06sD';'110815p8o07sD';'110815p8o08sD';'110815p8o09sD';'110815p8o10sD'];

  
    
for k=1:1:size(sMname,1)
    Mpom1=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom2=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom3=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom4=createTouches2(m,n,pocTrDot,dotykPst);
    
M=Mpom1+Mpom2+Mpom3+Mpom4;
clear Mpom1 Mpom2 Mpom3 Mpom4

  for i=1:1:size(M,1)
  for j=1:1:size(M,2)
  if(M(i,j)>1.9)
  M(i,j)=1;
  end
  end
  end

  sD=som_data_struct(M);

save(sDname(k,:),'sD');




  
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
end
