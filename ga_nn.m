function [ popawal, popakhir, allMse, allAcc] = ga_nn( dataInput, dataTarget, nPop, nHidden )
[m,n] = size(dataInput);
[o,p] = size(dataTarget);
%initialize population
for i=1:nPop
    [popawal1(i).net, popawal1(i).tr, popawal1(i).chromosome, popawal1(i).mse, popawal1(i).accuracy] = run_traingdx1(dataInput,dataTarget,nHidden);
    popawal1(i).fitness = 1/popawal1(i).mse;
end
%sort
popawal1=nestedSortStruct(popawal1,'mse');
%save init pop
popawal = popawal1;
%cek mse and acc genotype1
[c,d]=size(popawal);
for j=1:d
    allMse(1,j) = popawal(j).mse;
    allAcc(1,j) = popawal(j).accuracy;
end

% GA process
for h=1:100
        %selection >> roulette wheel
        [popawal1,popakhir] = f_selection(popawal1,nPop); 
        %crossover
        popakhir = f_crossover(popakhir,nPop,0.9);
        %get max/upperbound and min/lowerbound
        [s,z] = size(popakhir(1).chromosome);
        for i=1:nPop
           ValMax(i) = max(popakhir(i).chromosome);
           ValMin(i) = min(popakhir(i).chromosome);
        end
        maxval = max(ValMax);
        minval = min(ValMin);
        %mutation
        popakhir = f_mutation(0.08,popakhir,nPop,h,maxval,minval,6,5);
        %evaluate
        for j=1:nPop
            [popakhir(j).net,popakhir(j).tr, popakhir(j).mse, popakhir(j).accuracy] = run_traingdx(dataInput,dataTarget,nHidden,popakhir(j).chromosome);
            popakhir(j).fitness = 1/popakhir(j).mse;
        end
        %elitist
        for i=1:3
            popakhir(nPop+i) = popawal1(i);
        end
        %sort
        popakhir=nestedSortStruct(popakhir,'mse');
        [e,f]=size(popakhir);
        %cek semua mse
        for i=1:f
            allMse(h+1,i) = popakhir(i).mse;
            allAcc(h+1,i) = popakhir(i).accuracy;
        end
        %cut to 10
        popakhir = popakhir(:,1:10);
        %reinitialize population
        popawal1=popakhir;
end
end
