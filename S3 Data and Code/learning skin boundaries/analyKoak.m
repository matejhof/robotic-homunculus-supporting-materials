function []=analyKoak()

%add to path folder 'taxels details'
load('RHalfTaxPosCutV2.mat')

load('sums150715p4.mat')
 drawDens(sum815to824,RHalfTaxPos)
%  drawDens(sum735to744,RHalfTaxPos)
%  drawDens(sum725to734,RHalfTaxPos)
%  drawDens(sum715to724,RHalfTaxPos)
%  drawDens(sum865to874,RHalfTaxPos)
%  drawDens(sum875to884,RHalfTaxPos)
%  drawDens(sum655to664,RHalfTaxPos)
%  drawDens(sum525to534,RHalfTaxPos)
%  drawDens(sum625to634,RHalfTaxPos)

end

function []=drawDens(sumNeigh,RHalfTaxPos)

% cc1=cool(max(sumNeigh2)+1);
% cc1=autumn(max(sumNeigh)+1);
cc1=gray(1785+1);
max(sumNeigh)
cc=flipud(cc1);
% cc=cc1;
figure
hold on
axis equal
set(gca,'xtick',[],'ytick',[]);
for i=1:size(RHalfTaxPos,2)
%     if(sumNeigh(i)<=0)
%         plot(RHalfTaxPos(1,i),RHalfTaxPos(2,i),'.','MarkerSize',40,'color',[1,1,0.75])
%     else
plot(RHalfTaxPos(1,i),RHalfTaxPos(2,i),'o','MarkerSize',25,'MarkerFaceColor',cc(sumNeigh(i)+1,:),'MarkerEdgeColor','r')
%      end
end
end


% showTouch(RHalfTaxPos,sumNeigh2>2000)