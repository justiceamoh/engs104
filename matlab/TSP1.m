% Author: Justice Amoh
% Description: Function to Compute Approximate Solution for Euclidean TSP
% Dependency: used iscycle from 3rd party

%% PROBLEM 5


% H =[[0,1,0,2,0,0], ...
%     [1,0,3,0,0,0], ...
%     [0,3,0,1,0,1], ...
%     [2,0,1,0,4,0], ...
%     [0,0,0,4,0,8], ...
%     [0,0,1,0,8,0]];

function x = TSP1(T)
[S,w] = MST(T);
R     = S*2;
P     = epath(R);

end