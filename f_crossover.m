function [ newPop5 ] = f_crossover( newPop5,nPop,alpha )
%PXover=0.8;
first=0;
[x,y] = size(newPop5(1).chromosome);
%alpha=0.9;

% for i=1:nPop
%     px =rand();
%     if px < PXover
%         first=first+1;
%         if mod(first,2)==0
%             for j=1:point-1
%                 temp = newPop5(one).chromosome(j);
%                 newPop5(one).chromosome(j) = newPop5(i).chromosome(j);
%                 newPop5(i).chromosome(j) = temp;
%             end
%         else
%             one = i;
%         end
%     end
% end

for i=1:nPop
    %px =rand();
    %if px < PXover
        first=first+1;
        if mod(first,2)==0
            point=randi([1 x]);
            for j=point:x
                temp(j)=newPop5(one).chromosome(j);
                newPop5(one).chromosome(j)=(alpha*newPop5(i).chromosome(j))+((1-alpha)*newPop5(one).chromosome(j));
                newPop5(i).chromosome(j)=(alpha*temp(j))+((1-alpha)*newPop5(i).chromosome(j));
            end
        else
            one = i;
        end
    %end
end

end