%add to path folder 'taxels details'
load('RHalfTaxPosCutV2.mat')

%add to path folder 'learned SOMs'
load('060515p1o01.mat');

%add to path folder 'S1 Code'
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o01column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o01column13to24Thr','fig')


load('060515p1o02.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o02column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o02column13to24Thr','fig')

load('060515p1o03.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o03column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o03column13to24Thr','fig')

load('060515p1o04.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o04column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o04column13to24Thr','fig')

load('060515p1o05.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o05column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig060515p1o05column13to24Thr','fig')

%%%%%%%
load('130715p1o01.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o01column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o01column13to24Thr','fig')

load('130715p1o02.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o02column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o02column13to24Thr','fig')

load('130715p1o03.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o03column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o03column13to24Thr','fig')

load('130715p1o04.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o04column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o04column13to24Thr','fig')

load('130715p1o05.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o05column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.12,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig130715p1o05column13to24Thr','fig')


%%%%%%%
load('150715p4o01.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o01column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o01column13to24Thr','fig')

load('150715p4o02.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o02column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o02column13to24Thr','fig')

load('150715p4o03.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o03column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o03column13to24Thr','fig')

load('150715p4o04.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o04column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o04column13to24Thr','fig')

load('150715p4o05.mat');
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,1,1,12,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o05column1to12Thr','fig')
vizuRF1ZOOMAdGaps(sM,RHalfTaxPos,13,1,24,7,'thresh',0.13,'gap',[0.00025 0.000025],'marg_w',[0.1 0.1],'marg_h',[0.01 0.01])
saveas(gcf,'fig150715p4o05column13to24Thr','fig')

























