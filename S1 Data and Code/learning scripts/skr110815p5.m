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
  MRF(1:32,[1:11,21:31,41:51,61:71,81:91,101:111,121:131,141:151,161:171,181:191,201:211,221:231,241:251,261:271,281:291,301:311,321:331,341:351,361:371,381:391])=1;
  MRF(33:64,[10:20,30:40,50:60,70:80,90:100,110:120,130:140,150:160,170:180,190:200,210:220,230:240,250:260,270:280,290:300,310:320,330:340,350:360,370:380,390:400])=1;



  sMname=['110815p5o01';'110815p5o02';'110815p5o03';'110815p5o04';'110815p5o05';'110815p5o06';'110815p5o07';'110815p5o08';'110815p5o09';'110815p5o10'];

  sDname=['110815p5o01sD';'110815p5o02sD';'110815p5o03sD';'110815p5o04sD';'110815p5o05sD';'110815p5o06sD';'110815p5o07sD';'110815p5o08sD';'110815p5o09sD';'110815p5o10sD'];

  
    
for k=1:1:size(sMname,1)
    Mpom1=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom2=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom3=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom4=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom5=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom6=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom7=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom8=createTouches2(m,n,pocTrDot,dotykPst);
    
M=Mpom1+Mpom2+Mpom3+Mpom4+Mpom5+Mpom6+Mpom7+Mpom8;
clear Mpom1 Mpom2 Mpom3 Mpom4 Mpom5 Mpom6 Mpom7 Mpom8

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