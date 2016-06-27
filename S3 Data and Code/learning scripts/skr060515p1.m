addpath ('somtoolbox05m2809');

addpath('...\supporting_info\S1 Homunculus\train set');

baseName='060515p1';


load('RindivDigitsBCutCleaned.mat') 
num1=9000; %of 28915
choose1=randi(size(RindivDigitsBCleaned,1),1,num1);

load('RneighDigitsBCutCleaned.mat')
num2=5000; %of  14955
choose2=randi(size(RneighDigitsBCleaned,1),1,num2);

load('Rthumb_indexCutCleaned.mat')
num3=1700; %of  3000
choose3=randi(size(Rthumb_indexCleaned,1),1,num3);

load('Rpalm_fingersCCutCleaned.mat')
num4=1000; %of 6960
choose4=randi(size(Rpalm_fingersCCleaned,1),1,num4);

load('Rpalm1thumbCut.mat')
num5=6300; %of 8796
choose5=randi(size(Rpalm1thumb,1),1,num5);

load('Rpalm_forearm2handsNewCutCleaned.mat')
num6=1000; %of 4003
choose6=randi(size(Rpalm_forearm2handsCl,1),1,num6);

load('Rforearm1thumbCut.mat')
num7=15700; %of 18230
choose7=randi(size(Rforearm1thumb,1),1,num7);

load('Rforearm_upperarmCut.mat')
num8=2000; %of 8762
choose8=randi(size(Rforearm_upperarm,1),1,num8);

load('Rupperarm1thumbACut.mat')
num9=15700; %of 14228
choose9=randi(size(Rupperarm1thumbA,1),1,num9);

load('Rupperarm_torsoCut.mat')
num10=3000; %of 8862
choose10=randi(size(Rupperarm_torso,1),1,num10);

load('torso1exper1thumbCCut.mat')
num11=22000; %of 22105
choose11=randi(size(torso1exper1thumbC,1),1,num11);

%sum of the all training sets is about 138000

o=7;
p=24;

pocTrEp=25; %trainlen
radiusIni=5; %radius init
radiusFin=1; %radius final




Mtren=[RindivDigitsBCleaned(choose1,:);
RneighDigitsBCleaned(choose2,:);
Rthumb_indexCleaned(choose3,:);
Rpalm_fingersCCleaned(choose4,:);
Rpalm1thumb(choose5,:);
Rpalm_forearm2handsCl(choose6,:);
Rforearm1thumb(choose7,:);
Rforearm_upperarm(choose8,:);
Rupperarm1thumbA(choose9,:);
Rupperarm_torso(choose10,:);
torso1exper1thumbC(choose11,:)
];

MRF=ones(o*p,1154);
Minit=zeros(o*p,1154);

zona0init=0;
 

sMname=[strcat(baseName,'o01');strcat(baseName,'o02');strcat(baseName,'o03');strcat(baseName,'o04');strcat(baseName,'o05')];

sD=som_data_struct(Mtren);
save(strcat(baseName,'sD'),'sD');

for k=1:1:size(sMname,1)
   
  sM=som_randinit(sD,'msize',[o p]);
  sM.codebook=sM.codebook+Minit;
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end
