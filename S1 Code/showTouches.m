function showTouches(Pos,Tches)
%author Zdenek Straka
%function serves for visualization touches Tches in the skin (with taxel positions determined by Pos)
%Pos-matrix, first row-positions x, second row positions y, third row
%visible=1 invisible=0
%Tches-touches vectors in rows- activated taxel=1 else 0

p=1;
figure
for i=1:1:size(Tches)
showTouchFunc(Pos,Tches(i,:));

    i
pause(1/100);



    hold off;
end
function showTouchFunc(Pos,Tch)
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
if(size(red)>0)
plot(red(:,1),red(:,2),'or')
end
hold on;
if(size(green)>0)
axis equal;
plot(green(:,1),green(:,2),'og')
end

