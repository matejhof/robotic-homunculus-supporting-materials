addpath ('somtoolbox05m2809');

addpath('...\supporting_info\S1 Homunculus\train set');

baseName='150715p4';

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

MRF=zeros(o*p,1154);
Minit=zeros(o*p,1154);

zona0init=0;
 
MRF(1:7,49:60)=1; %thumb
Minit(1:7,49:60)=zona0init;
 
MRF(8:14,1:12)=1; %index
Minit(8:14,1:12)=zona0init;

 
MRF(15:21,13:24)=1; %middle
Minit(15:21,13:24)=zona0init;

 
MRF(22:28,25:36)=1; %ring
Minit(22:28,25:36)=zona0init;

 
MRF(29:35,37:48)=1; %little
Minit(29:35,37:48)=zona0init;

 
MRF(36:49,61:104)=1; %palm
Minit(36:49,61:104)=zona0init;
MRF(36:49,[37:39,45:48])=1;
MRF(36:49,[145:154,135:144,155:164,205:214])=1;
 
MRF(50:84,105:334)=1; %forearm
Minit(50:84,105:334)=zona0init;
MRF(50:84,[605:614,555:564,545:554,565:574,355:364,635:644,685:694,695:704,395:404,405:414,415:424,425:434,435:444,445:454])=1;
MRF(50:84,[94:104,72,78,82,73])=1;
 
MRF(85:119,335:714)=1; %upperarm
Minit(85:119,335:714)=zona0init;
MRF(85:119,[125:134,115:124,225:234,235:244,265:274,315:324,305:314,275:284,175:184,165:174,195:204,185:194,215:224,105:114,135:144,205:214])=1;
MRF(85:119,[735:744,725:734,755:764,765:774,715:724,855:864,865:874,875:884,785:794,795:804,805:814])=1;
 
MRF(120:168,715:1154)=1; %torso
MRF(120:168,[675:684,665:674,655:664,525:534,625:634,615:624,335:344,645:654,705:714,475:484,495:504,485:494,365:374,375:384])=1;



sMname=[strcat(baseName,'o01');strcat(baseName,'o02');strcat(baseName,'o03');strcat(baseName,'o04');strcat(baseName,'o05')];

sD=som_data_struct(Mtren);
save(strcat(baseName,'sD'),'sD');

for k=1:1:size(sMname,1)
   
  sM=som_randinit(sD,'msize',[o p]);
  sM.codebook=sM.codebook+Minit;
  sM=som_seqtrainMod82(sM,sD,MRF,'trainlen',pocTrEp,'radius_ini',radiusIni,'radius_fin',radiusFin);
save(sMname(k,:),'sM');
 
end
