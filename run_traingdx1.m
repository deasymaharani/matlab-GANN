function [ net,tr,weightBias,perf,accuracy ] = run_traingdx1(  dataInput,dataTarget,num_neuron )
%initialize network
net = patternnet(num_neuron,'traingdx');
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
net.trainParam.lr = 0.01;
net.trainParam.goal = 0;
net.divideParam.trainRatio = 0.70;
net.divideParam.testRatio = 0.30;
%configure network
net = configure(net, dataInput, dataTarget);
[net,tr] = train(net,dataInput,dataTarget);
weightBias = getwb(net);
%get data tes
testX = dataInput(:,tr.testInd);
testT = dataTarget(:,tr.testInd);
%test network
testY = net(testX);
perf = perform(net,testT,testY);
yl = testY';
threshold = graythresh(yl);
[c,cm]=confusion1(testT,testY,threshold);
accuracy = 100*(1-c);

end
