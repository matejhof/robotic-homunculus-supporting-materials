function h=vizuRF3AdGaps(sM,TaxPos,Mtest,varargin)
%author Zdenek Straka
%serves for visualization of RFs of the learned SOM
%Biomimetic RFs determination 


%sM- learned SOM (see manual to SOMtoolbox)
%TaxPos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
%Mtest-test set

%varargin 
%   gap- two elements vector [vertical,horizontal] defining the gap between neighbouring axes. Default value
%            is 0.01. Note this vale will cause titles legends and labels to collide with the subplots, while presenting
%            relatively large axis. 
%   marg_h  margins in height in normalized units (0...1)
%            or [lower uppper] for different lower and upper margins 
%   marg_w  margins in width in normalized units (0...1)
%            or [left right] for different left and right margins 
%   markerSizeRed
%   markerSizeGreen

markerSizeRed=10;
markerSizeGreen=10;
gap=[0.01,0.01];
marg_h=[0.05,0.05]; 
marg_w=[0.05,0.05];
tightVer=0;
threshold=10;

if nargin < 4

else
    
i=1;
argok = 1;
while i<=length(varargin)
  if ischar(varargin{i})
    switch varargin{i}, 
     case 'markerSizeRed', i=i+1; markerSizeRed = varargin{i}; i=i+1;
     case 'markerSizeGreen', i=i+1; markerSizeGreen = varargin{i}; i=i+1;
     case 'gap', i=i+1; gap = varargin{i}; tightVer=1; i=i+1;      
     case 'marg_h', i=i+1; marg_h = varargin{i}; tightVer=1; i=i+1;    
     case 'marg_w', i=i+1; marg_w = varargin{i}; tightVer=1; i=i+1;       
     
        otherwise, argok=0;
    end
    if ~argok 
    error('invalid input argument'); 
    end
  end
end    
end;


M=zeros(size(sM.codebook));

for i=1:size(Mtest,1)
[wn,~]=som_bmusDP(sM,Mtest(i,:));
M(wn,:)=M(wn,:)+Mtest(i,:);
end
tightParams={gap, marg_h, marg_w};
h=vizuRFPom(M,TaxPos,sM,threshold,markerSizeRed,markerSizeGreen,tightVer,tightParams);

function h=vizuRFPom(M,TaxPos,sM,thresho,markerSizeRed,markerSizeGreen,tightVer,tightParams)

m=sM.topol.msize(1);
n=sM.topol.msize(2);
h=figure; 
count=1;
for j=1:n
for i=1:m
    
if tightVer %use subtight plot function istead of subplot
 subtightplot(m,n,(i-1)*n+j,tightParams{:})   
else
subplot(m,n,(i-1)*n+j)
end  

showTouchFunc(TaxPos,1/thresho*M(count,:),markerSizeRed,markerSizeGreen)
count=count+1;

end

end

function showTouchFunc(Pos,Tch,markerSizeRed,markerSizeGreen)
%Pos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
%Tch-touch vector- activated=1 else 0
red=[];
green=[];
for j=1:1:size(Pos,2)
if not(Pos(3,j)==0)
    if Tch(1,j)>=1

red=[red;[Pos(1,j),Pos(2,j)]];
    else

green=[green;[Pos(1,j),Pos(2,j)]];

    end
    
end
end
 if(size(green)>0)
plot(green(:,1),green(:,2),'.g','MarkerSize',markerSizeGreen)
 end
hold on;
if(size(red)>0)
plot(red(:,1),red(:,2),'.r','MarkerSize',markerSizeRed)
end
axis equal;
set(gca,'XTickLabel',[],'YTickLabel',[])