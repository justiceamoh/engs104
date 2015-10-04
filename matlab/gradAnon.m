function g = gradAnon(x,eps,f)

% Approximate gradient by divided difference of anonymous function
% Add epsilon to each axis and divide by f(x+eps,y) by epsilon
g   = zeros(1,2);
g(1)= (f(x+[eps 0]) - f(x))/eps;
g(2)= (f(x+[0 eps]) - f(x))/eps;

end

