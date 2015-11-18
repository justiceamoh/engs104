% Author: Justice Amoh
% Description: Function to Find Eulerian Path in G

%% PROBLEM 3
% G=   [0     2     0     2     0     0; ...
%       2     0     0     0     0     0; ...
%       0     0     0     2     0     2; ...
%       2     0     2     0     2     0; ...
%       0     0     0     2     0     0; ...
%       0     0     2     0     0     0];



function y = epath(G)

if (~Eulerian(G))
    y = 0;
    return;
end

[n,~]   = size(G);
[xx,yy, ww] = find(G);
indx    = [];

for k = 1:length(ww)
    vec = [xx(k) yy(k)];
  indx = [indx;kron(vec,ones(ww(k),1))];       
end

stack = indx;


i = randi(n);
P = stack(i,:); 

while (1)
    v = stack(i,:);
    idxa = find(stack(:,1)==v(1) & stack(:,2)==v(2),1);
    idxb = find(stack(:,1)==v(2) & stack(:,2)==v(1),1);
    idx      = [idxa idxb];
   
    stack(idx,:) = [];   % remove edges
    
    if(isempty(stack))
        break;
    end
    
    idx = find(stack(:,1)==v(end) & stack(:,2)~=v(1),1); %find next edge from last node
    
    if(isempty(idx) && ~isempty(stack)) %if wrong branch, start again
%         i = randi(n);
        i = randi(size(stack,1)); 
        i = stack(i,1);
        stack = indx;
        P = stack(i,:);
    else    
        P(end:end+1) = stack(idx,:);
        i = idx;
    end
end

y = P;


end