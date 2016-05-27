function [ net,tr,perf,accuracy ] = run_traingdx( dataInput,dataTarget,num_neuron,wb_GA )
net = patternnet(num_neuron,'traingdx');
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
net.trainParam.lr = 0.01;
net.trainParam.goal = 0;
net.divideParam.trainRatio = 0.70;
net.divideParam.testRatio = 0.30;
net = configure(net, dataInput, dataTarget);
net = setwb(net,wb_GA);
[net,tr] = train(net,dataInput,dataTarget);
%get data tes
testX = dataInput(:,tr.testInd);
testT = dataTarget(:,tr.testInd);
testY = net(testX);
perf = perform(net,testT,testY);
yl = testY';
threshold = graythresh(yl);
[c,cm]=confusion1(testT,testY,threshold);
accuracy = 100*(1-c);

end