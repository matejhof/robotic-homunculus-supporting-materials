function [meanF,stdF] = measure2(sM,taxPos,Mtest)
%author Zdenek Straka
%Topology Preservation Measure with External Distance Metric (TPMEDM)
%function serves for evaluation of learned SOMs (skin representation) 
%params:sM- learned SOM (see manual to SOMtoolbox)
%taxPos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
%Mtest-test set


neighM = som_neighborhood(som_unit_neighs(sM));
%neighborhood matrix- neighM(i,j)- distance between unit i and unit j

threshold=1;
M=zeros(size(sM.codebook));

%for each neuron assign taxels that was activated when the neuron won 
for i=1:size(Mtest,1)
[wn,~]=som_bmusDP(sM,Mtest(i,:));
M(wn,:)=M(wn,:)+Mtest(i,:);
end


dist=[];
%for each couple of neigbouring neurons i,j determine taxels that are
%in receptive fields(RF) of both neurons i,j and exceed threshold (save in vector mpom)
%it means approximately that in mpom is saved union of RFs of the neuron i and the neuron j 
for i = 1:size(neighM,1)
 for j = 1:i-1
  if (neighM(i,j) < 1.5 && neighM(i,j) > 0) %if unit i and j are next to each other
      
    mpom=(M(i,:)>threshold)+(M(j,:)>threshold);
 
    
    for k=1:size(mpom,2)
       for l=1:k-1
    %for each couple of taxels from union of RFs of neurons i and j compute an euclidean distance d of these taxels    
      if (mpom(k)>=1 && mpom(l)>=1)   
     d = taxDist(k,l,taxPos);
    dist = [dist d]; %add d to multiset dist
      end
       end
    end
    
    

    
    
    
  end
 end
end
meanF = mean(dist);
stdF = std(dist);

%compute euclidean distance of taxels tax1 and tax2
function d = taxDist(tax1,tax2,taxPos)
d = norm(taxPos(:,tax1)-taxPos(:,tax2));

