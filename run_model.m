tic
dataInput = hepa_pca;
dataTarget = hepatitisTargets;
nPop = 10;
nHidden = 8;
%get optimal initial weights and biases
[popawal, popakhir, allMse, allAcc] = ga_nn( dataInput, dataTarget, nPop, nHidden );
toc
time = toc;
%test and compare init over final network 
[accuracyf, perff, accuracyi, perfi] = tes_model4(dataInput,dataTarget,popakhir(1).net,popakhir(1).tr,popawal(1).net,popawal(1).tr);
