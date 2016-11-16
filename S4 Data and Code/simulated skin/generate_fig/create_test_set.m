addpath('S1 Code')
load('S1 Data and Code/taxels details/taxPosArtSkin20x20.mat')

  sigma_mean=1.2;
  sigma_std=0.2;
  gain_mean=1;
  gain_std=0.2;
  pocDot=10000;
   

   Mtest = generate_stimuli_cont_rand_sigma_gain(TaxPos, pocDot, sigma_mean, sigma_std, gain_mean, gain_std);
   
   save('Mtest241016','Mtest');
