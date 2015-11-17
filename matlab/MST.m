% Author: Justice Amoh
% Description: Function to Compute Minimal Spanning Tree for H
% Dependency: used iscycle from 3rd party

%% PROBLEM 4

function [M,w] = MST(H)
% H is a connected graph

[n,~]      = size(H);
[xx,yy,ww] = find(H);
indx       = [xx yy ww];

stack    = sortrows(indx);
edges    = [];
weights  = [];


% find unique edges and corresponding weights
while(~isempty(stack))
    v       = stack(1,:);
    edges   = [edges; v(1:2)];
    weights = [weights; v(3)];
    
    [~,idx] = ismember([v(1:2);fliplr(v(1:2))],stack(:,1:2),'rows');
    stack(idx,:) = [];       
end

% sort edges by weights
temp = sortrows([edges weights],3);
edges = temp(:,1:2); weights = temp(:,3);

ne = length(weights);
S  = zeros(1,n);
F  = [];
for i = 1:ne
    
   v = edges(i,:);
   [S,c] = iscycle(S,v); 

    if c == 0
        F = [F;[edges(i,:) weights(i)]];
    end
end

% Sum up weights to get MST weight
w = sum(F(:,3));
M  = zeros(n);

for i = 1:size(F,1)
   M(F(i,1),F(i,2)) = 1; 
   M(F(i,2),F(i,1)) = 1; 
end


end