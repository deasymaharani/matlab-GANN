function [ ylf,accuracyf, perff, accuracyi, perfi ] = tes_model4( dataInput,dataTarget,netfin,trfin,netinit,trinit )
%get data tes chrom final
testXf = dataInput(:,trfin.testInd);
testTf = dataTarget(:,trfin.testInd);
%get data tes chrom init
testXi = dataInput(:,trinit.testInd);
testTi = dataTarget(:,trinit.testInd);
%simulate tes net final
testYf = netfin(testXf);
perff = perform(netfin,testTf,testYf);
ylf = testYf';
thresholdf = graythresh(ylf);
[cf,cm]=confusion1(testTf,testYf,thresholdf);
accuracyf = 100*(1-cf);
%simulate tes net init
testYi = netinit(testXi);
perfi = perform(netinit,testTi,testYi);
yli = testYi';
thresholdi = graythresh(yli);
[ci,cm]=confusion1(testTi,testYi,thresholdi);
accuracyi = 100*(1-ci);
fprintf('accuracy final: %f\n',accuracyf);
fprintf('mse final : %f\n',perff);
fprintf('accuracy init: %f\n',accuracyi);
fprintf('mse init : %f\n',perfi);

end