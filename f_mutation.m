function [ newPop5 ] = f_mutation( PMUT,newPop5,nPop,t,ub,lb,b,n_mut )
[x,y] = size(newPop5(1).chromosome);
T=100;
rl = 0.0001; ru=0.1;

for i=1:nPop
    p=(ru-rl).*rand()+rl;
    if p<PMUT
        p=int64(p*10000);
        if mod(p,2)==0
            for k=1:n_mut
                j=randi([1 x]);
                y=ub-newPop5(i).chromosome(j);
                r=rand();
                d=y*(1-r^((1-t/T)^b));
                newPop5(i).chromosome(j)=newPop5(i).chromosome(j)+d;
            end
        else
            for k=1:n_mut
                j=randi([1 x]);
                y=newPop5(i).chromosome(j)-lb;
                r=rand();
                d=y*(1-r^((1-t/T)^b));
                newPop5(i).chromosome(j)=newPop5(i).chromosome(j)-d;
            end
        end
    end
end
 
end