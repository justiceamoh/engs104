% Author: Justice Amoh
% Description: ENGS 104 - Optimization: Assignment 3
% Date: 11/16/2015


%% PROBLEM 1

G = [0 1 1 1 1; ...
     1 0 1 0 0; ...
     1 1 0 0 0; ...
     1 0 0 0 1; ...
     1 0 0 1 0];

h = plot(graph(G));
h.NodeColor  = 'red';
h.MarkerSize = 6;
title('Graph');

P = [5 4 1 2 3 1]; 
isEulerian = Eulerian(G);
isPath = isapath(G,P);



H = [0 3 0 0 1; ...
     3 0 5 0 4; ...
     0 5 0 2 6; ...
     0 0 2 0 7; ...
     1 4 6 7 0];