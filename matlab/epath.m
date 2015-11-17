% Author: Justice Amoh
% Description: Function to Find Eulerian Path in G

%% PROBLEM 3

function y = epath(G)

if (~Eulerian(G))
    y = 0;
    return;
end

[n,~]   = size(G);
[xx,yy] = find(G==1);
indx    = [xx yy];
stack   = indx;

i = randi(n);
P = stack(i,:); 

while (1)
    v = stack(i,:);
    [~,idx] = ismember([v;fliplr(v)],stack,'rows');  % find edges
    stack(idx,:) = [];   % remove edges
    
    if(isempty(stack))
        break;
    end
    
    idx = find(stack(:,1)==v(end),1); %find next edge from last node
    
    if(isempty(idx) && ~isempty(stack)) %if wrong branch, start again
        i = randi(n);
        stack = indx;
        P = stack(i,:);
    else    
        P(end:end+1) = stack(idx,:);
        i = idx;
    end
end

y = P;


end