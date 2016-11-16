clear all;
close all;
 addpath ('somtoolbox05m2809');
 load('taxPosArtSkin20x20.mat')

  m=20; %skin size m-y, n-x
  n=20;
  o=8;  %map size
  p=8;
  pocTrDot=100000; %number of training touches
  dotykPst=1;  
  pocTrEp=24; %trainlen
  radiusIni=5; %radius init
  radiusFin=1; %radius final
  
  sigma_mean=1.2;
  sigma_std=0.2;
  gain_mean=1;
  gain_std=0.2;
  
  RF=ones(o*p,m*n);


  sMname=['241016ASp3o01';'241016ASp3o02';'241016ASp3o03';'241016ASp3o04';'241016ASp3o05'];

  sDname=['241016ASp3o01sD';'241016ASp3o02sD';'241016ASp3o03sD';'241016ASp3o04sD';'241016ASp3o05sD'];
  
    
for k=1:1:size(sMname,1)
   M = generate_stimuli_cont_rand_sigma_gain(TaxPos, pocTrDot, sigma_mean, sigma_std, gain_mean, gain_std);
%     Mpom1=createTouches2(m,n,pocTrDot,dotykPst);
    
% M=Mpom1;
% clear Mpom1


  sD=som_data_struct(M);

save(sDname(k,:),'sD');
  
  sM=som_randinit(sD,'msize',[o p]);
  sM=som_seqtrainMod82(sM,sD,RF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
end
