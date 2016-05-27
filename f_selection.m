function [ genotype1,newPop5 ] = f_selection( genotype1,nPop )
%find total fitness
sum=0.0;
for i=1:nPop
    sum=sum+genotype1(i).fitness;
end
%calculate relative and cumulative fitness
total=0;
for i=1:nPop
    genotype1(i).rfitness=genotype1(i).fitness/sum;
    total=total+genotype1(i).rfitness;
    genotype1(i).cfitness=total;    
end
%initialize struct newPop
newPop5=genotype1;
%select survivors using cumfitness
for i=1:nPop
    p=rand();
    if(p<genotype1(1).cfitness)
        newPop5(i)=genotype1(1);
    else
        for j=1:nPop
            if genotype1(j).cfitness<=p && p<genotype1(j+1).cfitness
                newPop5(i)=genotype1(j+1);
            end
        end
    end
end
end