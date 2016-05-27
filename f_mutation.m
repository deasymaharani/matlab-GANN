function [ newPop5 ] = f_mutation( PMUT,newPop5,nPop,t,ub,lb,b,n_mut )
[x,y] = size(newPop5(1).chromosome);
%PMUT=0.08;
%b=5;
% t=2;
T=100;
rl = 0.0001; ru=0.1;
% rl = 1; ru = 1000;
for i=1:nPop
    p=(ru-rl).*rand()+rl;
    %p=randi([rl ru]);
    %if p/10000<PMUT
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

% for i=1:nPop
%     p=rand();
%     if p<PMUT
%         for k=1:2
%         j(i,k) = randi([1 x]);
%         %fprintf('mutation index at %d.\n',j);
%         end
%         temp = newPop5(i).chromosome(j(i,1));
%         newPop5(i).chromosome(j(i,1)) = newPop5(i).chromosome(j(i,2));
%         newPop5(i).chromosome(j(i,2)) = temp;
%     end
% end
