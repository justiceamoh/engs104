% Author: Justice Amoh
% Description: Function to check whether graph is Eulerian
% ENGS 104 - Optimization: Assignment 3

%% PROBLEM 1

function y = Eulerian(A)

[n,~]  = size(A);
isEven = sum(mod(sum(A,2),2)) == 0;   % check if all rows sum to even
isConnected = min(min((A+eye(n))^(n-1))) ~= 0;  % check if connected
y = isConnected & isEven;

end