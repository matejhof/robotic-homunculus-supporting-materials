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
  
  RF=ones(o*p,m*n);




  sMname=['2610p2o01';'2610p2o02';'2610p2o03';'2610p2o04';'2610p2o05'];

  sDname=['2610p2o01sD';'2610p2o02sD';'2610p2o03sD';'2610p2o04sD';'2610p2o05sD'];
  
    
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
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
end
