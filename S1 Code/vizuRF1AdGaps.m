function vizuRF1AdGaps(sM,TaxPos,varargin)
%author Zdenek Straka
%serves for visualization of RFs of the learned SOM
%weight vector components exceeding the threshold==RF 

%sM- learned SOM (see manual to SOMtoolbox)
%TaxPos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
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

%default values
markerSizeRed=10;
markerSizeGreen=10;
gap=[0.01,0.01];
marg_h=[0.05,0.05]; 
marg_w=[0.05,0.05];
tightVer=0;
threshold=0.05;

if nargin < 3

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
     case 'thresh', i=i+1; threshold=varargin{i}; i=i+1;   
     
        otherwise, argok=0;
    end
    if ~argok 
    error('invalid input argument'); 
    end
  end
end
end


    


%Pro kazdy neuron jsou cerveny ty taxely, jejichz slozka ve vahovem vektoru prekroci nastaveny threshold(zatim nastaveno 0.05).

m=sM.topol.msize(1);
n=sM.topol.msize(2);
figure
count=1;
for j=1:n
for i=1:m
    
if tightVer %use subtight plot function istead of subplot
 subtightplot(m,n,(i-1)*n+j,gap, marg_h, marg_w)   
else
subplot(m,n,(i-1)*n+j)
end

showTouchFunc(TaxPos,1/threshold*sM.codebook(count,:),markerSizeRed,markerSizeGreen)
count=count+1;

end

end
end

function showTouchFunc(Pos,Tch,markSizeRed,markSizeGreen)
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
axis equal;
% set(gca,'XTickLabel',[],'YTickLabel',[])

if(size(green)>0)
plot(green(:,1),green(:,2),'.g','Markersize',markSizeGreen)
end
hold on;
if(size(red)>0)    
axis equal;
plot(red(:,1),red(:,2),'.r','Markersize',markSizeRed)
end
set(gca,'XTickLabel',[],'YTickLabel',[])
end