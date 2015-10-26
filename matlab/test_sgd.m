%% Stochastic Gradient Descent
% $$ x_{old} - 2\alpha(a_{i}x_{old} - b_{i})a_{i}^{T} $$

A = rand(10,5);
b = rand(10,1);

solution = (A'*A)^-1*A'*b; 
check = (A*solution - b)'*A;  % residual is orthogonal to A

m = 10;
y = rand(10,1);
for n=1:100000
    i= mod(n,m) + 1;
    y=y-(1/n)*(A(i,:)*y-b(i))*A(i,:)';
end
