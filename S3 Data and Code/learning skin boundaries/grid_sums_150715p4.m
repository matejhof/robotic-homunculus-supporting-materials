function []=grid_sums_150715p4()
load('150715p4sD.mat')
trSet=sD.data;

sum815to824=sumfce(815:824,trSet);
sum735to744=sumfce(735:744,trSet);
sum725to734=sumfce(725:734,trSet);
sum715to724=sumfce(715:724,trSet);
sum865to874=sumfce(865:874,trSet);
sum785to794=sumfce(785:794,trSet);
sum795to804=sumfce(795:804,trSet);
sum875to884=sumfce(875:884,trSet);
sum665to674=sumfce(665:674,trSet);
sum655to664=sumfce(655:664,trSet);
sum525to534=sumfce(525:534,trSet);
sum625to634=sumfce(625:634,trSet);

clear trSet
clear sD

save sums150715p4.mat

end

function sumPoz=sumfce(basis_tax,trSet)
tmp=sum(trSet(:,basis_tax),2);
idxNonZero=find(tmp>0);
sumPoz=sum(trSet(idxNonZero,:));
end