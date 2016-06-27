function showTouch(Pos,Tch)
%author Zdenek Straka
%function serves for visualization touch Tch in the skin (with taxel positions determined by Pos)
%params:Pos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
%Tch-touch vector- activated=1 else 0
markerSizeRed=10;
markerSizeGreen=10;
red=[];
green=[];
figure;
set(gcf,'color','w');
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
axis off;
if(size(red)>0)
plot(red(:,1),red(:,2),'.r','MarkerSize',markerSizeRed)
end
hold on;
if(size(green)>0)
axis equal;
axis off;
plot(green(:,1),green(:,2),'.g','MarkerSize',markerSizeGreen)
end