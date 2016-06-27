
%% generate Tab with values of measure2 for each trial
%   sMname={'1812p12','1612p8','2612p2','2112p1','140815p1','140815p2','140815p3','140815p4'};
%   numTrials=10;
%   pom=0;
%   xoffset=1;
%   yoffset=2;
%   load('...\S1 multi-touch torso\taxels details\TorsoTaxPosCut.mat')
%   
%   load('...\S1 multi-touch torso\train set\torso1exper1thumbACut.mat')
%   Mtest=TrainTorso1expA(1:10000,:);
%   
%   for i=1:numTrials
%   Tab{2+i,1}=strcat('o',int2str(i-1));
%   end
%   
%   for i=1:2:2*size(sMname,2)
%   pom=pom+1;
%   Tab{1,1+i}=sMname{pom};
%   Tab{1,1+i+1}=sMname{pom};
%   Tab{2,1+i}='mean';
%   Tab{2,1+i+1}='std';
%   end
%   
%   tmpIter=1;
%   for i=1:size(sMname,2)
%   
%       for j=1:numTrials
%         
%       tmpStr=strcat('...\S1 multi-touch torso\learned SOMs\',sMname{i},'o',int2str(j-1),'.mat');
% 
%       load(tmpStr);
%         %add to path folder 'S1 Code'
%       [tmpMeanF,tmpStdF] = measure2(sM,TorsoTaxPosCut,Mtest);
%       Tab{yoffset+j,xoffset+tmpIter}=tmpMeanF;
%       Tab{yoffset+j,xoffset+tmpIter+1}=tmpStdF;
%       end
%       tmpIter=tmpIter+2;
%   end

%%



%% adding lines with mean and std

% 
% Tab{14,1}='mean';
% 
% for i=2:2:17
% Tab{14,i}=mean(cell2mat(Tab(3:12,i)));
% end
% 
% Tab{15,1}='std';
% for i=2:2:17
% Tab{15,i}=std(cell2mat(Tab(3:12,i)));
% end


%%

%%create matrices with a values of the mean and the std by
%%sMtabSynthTouch.xlsx and create table in latex format

load('sMTabmeasureValuesTorso.mat')

iter=2;
meanM=zeros(2,4);
stdM=zeros(2,4);
for i=1:4
for j=1:2
meanM(j,i)=Tab{14,iter};
stdM(j,i)=Tab{15,iter};
iter=iter+2;
end
end

% print in a latex format
for k=1:size(meanM,1)
    fprintf('%4.2f pm %4.2f & %4.2f pm %4.2f & %4.2f pm %4.2f & %4.2f pm %4.2f\\\\ \n', meanM(k,1), stdM(k,1), meanM(k,2), stdM(k,2), meanM(k,3), stdM(k,3), meanM(k,4), stdM(k,4))
end

bar3([2,1],meanM);
set(gca,'XTickLabel',['1 MRF'; '2 MRF'; '4 MRF'; '8 MRF'],'YTickLabel',['2-touch'; '1-touch'],'FontSize',12)
xlabel('number of MRF','FontSize',12)
ylabel('number of simultaneous stimulations on the skin','FontSize',12)
zlabel('TPMEDM (mean)','FontSize',12)



