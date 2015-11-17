% Author: Justice Amoh
% Description: ENGS 104 - Optimization: Assignment 3
% Date: 11/16/2015


%% PROBLEM 1


G = [0 1 1 1 1; ...
     1 0 1 0 0; ...
     1 1 0 0 0; ...
     1 0 0 0 1; ...
     1 0 0 1 0];

plot(graph(G));
title('Graph');
P = [5 4 1 2 3 1]; 
isEulerian = Eulerian(G);

 