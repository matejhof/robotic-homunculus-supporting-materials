%add to path folder 'somtoolbox05m2809'

%add to path folder 'taxels details'
load('RHalfTaxPosCutV2.mat')

load('Mtest260215.mat')

%add to path folder 'learned SOMs'
load('150216p1o01.mat');

%add to path folder 'S1 Code'
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,1,1,12,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o01column1to12BiomRF','fig')
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,13,1,24,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o01column13to24BiomRF','fig')


load('150216p1o02.mat');
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,1,1,12,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o02column1to12BiomRF','fig')
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,13,1,24,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o02column13to24BiomRF','fig')

load('150216p1o03.mat');
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,1,1,12,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o03column1to12BiomRF','fig')
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,13,1,24,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o03column13to24BiomRF','fig')

load('150216p1o04.mat');
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,1,1,12,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o04column1to12BiomRF','fig')
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,13,1,24,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o04column13to24BiomRF','fig')

load('150216p1o05.mat');
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,1,1,12,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o05column1to12BiomRF','fig')
vizuRF3ZOOMAdGaps(sM,RHalfTaxPos, Mtest,13,1,24,7,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150216p1o05column13to24BiomRF','fig')
