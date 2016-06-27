
%% generate Tab with values of measure2 for each trial
%   sMname={'2210p8','2210p7','2210p6','2210p5','2610p2','110815p1','110815p2','110815p3','110815p4','110815p5','110815p6','110815p7','110815p8','110815p9','110815p10'};
%   numTrials=10;
%   pom=0;
%   xoffset=1;
%   yoffset=2;
%   load('....\supporting_info\S1 Multi-touch simulated skin\taxels details\taxPosArtSkin20x20.mat')
%   %add to path folder 'S1 Code'
%   Mtest=createTouches2(20,20,10000,1);
%   
%   for i=1:numTrials
%   Tab{2+i,1}=strcat('o',int2str(i));
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
%           if j<10
%       tmpStr=strcat('...\supporting_info\S1 multi-touch simulated skin\learned SOMs\',sMname{i},'o0',int2str(j),'.mat');
%           else
%       tmpStr=strcat('...\supporting_info\S1 multi-touch simulated skin\learned SOMs\',sMname{i},'o',int2str(j),'.mat');
%           end
%       load(tmpStr);
%       [tmpMeanF,tmpStdF] = measure2(sM,TaxPos,Mtest);
%       Tab{yoffset+j,xoffset+tmpIter}=tmpMeanF;
%       Tab{yoffset+j,xoffset+tmpIter+1}=tmpStdF;
%       end
%       tmpIter=tmpIter+2;
%   end

%%


% %% adding lines with mean and std
% 
% 
% Tab{14,1}='mean';
% 
% for i=2:2:31
% Tab{14,i}=mean(cell2mat(Tab(3:12,i)));
% end
% 
% Tab{15,1}='std';
% for i=2:2:31
% Tab{15,i}=std(cell2mat(Tab(3:12,i)));
% end
% 
%%

%%create matrices with a values of the mean and the std by
%%sMtabSynthTouch.xlsx and create table in latex format

load('sMTabmeasureValues.mat')

iter=2;
meanM=zeros(5,3);
stdM=zeros(5,3);
for i=1:3
for j=1:5
meanM(j,i)=Tab{14,iter};
stdM(j,i)=Tab{15,iter};
iter=iter+2;
end
end

% print in a latex format
for k=1:size(meanM,1)
    fprintf('%4.2f pm %4.2f & %4.2f pm %4.2f & %4.2f pm %4.2f\\\\ \n', meanM(k,1), stdM(k,1), meanM(k,2), stdM(k,2), meanM(k,3), stdM(k,3))
end

bar3([5,4,3,2,1],meanM);
set(gca,'XTickLabels',['1 MRF'; '2 MRF'; '4 MRF'],'YTickLabels',['8-touch'; '6-touch'; '4-touch'; '2-touch'; '1-touch'],'FontSize',12)
xlabel('number of MRF','FontSize',12)
ylabel('number of simultaneous stimulations on the skin','FontSize',12)
zlabel('TPMEDM (mean)','FontSize',12)


%%  
