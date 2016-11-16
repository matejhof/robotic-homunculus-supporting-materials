function [ neurAct ] = generate_stimuli_cont_rand_sigma_gain(taxPos, num, sigma_mean, sigma_std, gain_mean, gain_std)
%author Zdenek Straka
%function generates gaussian stimuli, num determines number of these stimuli

minX=min(taxPos(1,:));
maxX=max(taxPos(1,:));
minY=min(taxPos(2,:));
maxY=max(taxPos(2,:));

numTax=size(taxPos,2);

X = minX + (maxX-minX).*rand(num,1);
Y = minY + (maxY-minY).*rand(num,1);
centers=[X,Y]';

neurAct=zeros(num,numTax);

for i=1:size(centers,2)
%     abs for preventing negative values
sigma=abs(sigma_mean + sigma_std.*randn);
gain= abs(gain_mean + gain_std.*randn);
cent=centers(:,i);
centC=repmat(cent,1,numTax);
diffTaxCent=taxPos(1:2,:)-centC;
distTaxCent=sqrt(sum(diffTaxCent.^2,1));
neurAct(i,:) = gain.*pdf('Normal',distTaxCent,0,sigma);
end

end

