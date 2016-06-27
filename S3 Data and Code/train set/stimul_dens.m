clear all
load('...\train set\torso2exper2thumbsBCut.mat')
load('...\taxels details\TorsoTaxPosCut.mat')
addpath('somtoolbox05m2809')
load('...\train set\torso1exper1thumbACut.mat') % from folder train set
addpath('...\learned SOMs')

%%fig1-taxels density stimulation
sums=sum(TrainTorso2expB);
cc1=cool(max(sums)+1);
max(sums)
%cc=flipud(cc1)
cc=cc1;
figure
hold on
axis equal
set(gca,'xtick',[],'ytick',[]);
for i=1:size(TorsoTaxPosCut,2)
plot(TorsoTaxPosCut(1,i),TorsoTaxPosCut(2,i),'.','MarkerSize',30,'color',cc(sums(i)+1,:))

end

%%fig2-1MRF- taxels present in RF





Mtest=TrainTorso1expA(1:10000,:);
 load('1612p8o5.mat')
threshold=10;
M=zeros(size(sM.codebook));

%for each neuron assign taxels that was activated when the neuron won 
for i=1:size(Mtest,1)
[wn,~]=som_bmusDP(sM,Mtest(i,:));
M(wn,:)=M(wn,:)+Mtest(i,:);
end



Mthr=M>=threshold;



Msums=sum(Mthr); % how many times is taxel present in some RF of neurons

cc1=cool(12+1);
max(Msums)
%cc=flipud(cc1)
cc=cc1;
figure
hold on
axis equal
set(gca,'xtick',[],'ytick',[]);
for i=1:size(TorsoTaxPosCut,2)
plot(TorsoTaxPosCut(1,i),TorsoTaxPosCut(2,i),'.','MarkerSize',30,'color',cc(Msums(i)+1,:))
end



%%fig3-8MRF
load('140815p4o0.mat')


M=zeros(size(sM.codebook));

%for each neuron assign taxels that was activated when the neuron won 
for i=1:size(Mtest,1)
[wn,~]=som_bmusDP(sM,Mtest(i,:));
M(wn,:)=M(wn,:)+Mtest(i,:);
end

Mthr=M>=threshold;

Msums=sum(Mthr); % how many times is taxel present in some RF of neurons

cc1=cool(12+1);
max(Msums)
%cc=flipud(cc1)
cc=cc1;
figure
hold on
axis equal
set(gca,'xtick',[],'ytick',[]);
for i=1:size(TorsoTaxPosCut,2)
plot(TorsoTaxPosCut(1,i),TorsoTaxPosCut(2,i),'.','MarkerSize',30,'color',cc(Msums(i)+1,:))
end
