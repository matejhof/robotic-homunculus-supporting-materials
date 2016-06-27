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




  sMname=['2210p5o01';'2210p5o02';'2210p5o03';'2210p5o04';'2210p5o05'];

  sDname=['2210p5o01sD';'2210p5o02sD';'2210p5o03sD';'2210p5o04sD';'2210p5o05sD'];
  
    
for k=1:1:size(sMname,1)
    Mpom1=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom2=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom3=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom4=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom5=createTouches2(m,n,pocTrDot,dotykPst);
    Mpom6=createTouches2(m,n,pocTrDot,dotykPst);
    
M=Mpom1+Mpom2+Mpom3+Mpom4+Mpom5+Mpom6;
clear Mpom1 Mpom2 Mpom3 Mpom4 Mpom5 Mpom6

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
