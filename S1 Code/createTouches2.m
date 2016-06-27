 function M=createTouches2(msize,nsize,number,pstD)
 %author Zdenek Straka
 %function create 1-touch stimulations in a skin (size msize*nsize)
 %number of the stimulations is determined by the parameter number
 %pstD-probability of activation non-centred taxel

M=zeros(number,msize*nsize);

for i=1:1:number
Mpom=zeros(msize,nsize);
xpos=randi([0 nsize+1],1,1);
ypos=randi([0 msize+1],1,1);
Mpom=addTouch(xpos,ypos,Mpom,pstD);


Mpom=addTouch(xpos+1,ypos,Mpom,pstD);
 Mpom=addTouch(xpos-1,ypos,Mpom,pstD);
 Mpom=addTouch(xpos,ypos+1,Mpom,pstD);
 Mpom=addTouch(xpos,ypos-1,Mpom,pstD);
 Mpom=addTouch(xpos+1,ypos+1,Mpom,pstD);
 Mpom=addTouch(xpos-1,ypos+1,Mpom,pstD);
 Mpom=addTouch(xpos+1,ypos-1,Mpom,pstD);
 Mpom=addTouch(xpos-1,ypos-1,Mpom,pstD);
 

Mpom1=Mpom';
M(i,:)=Mpom1(:)';
end



function Mp=addTouch(x,y,Mp,pst)
if(x>=1 && y>=1 && x<=size(Mp,2) && y<=size(Mp,1))
if(rand<=pst)    
Mp(y,x)=1;
end
end

