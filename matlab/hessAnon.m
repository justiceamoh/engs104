function h = hessAnon(x,eps,f)
% Approximate Hessian by divided difference of anonymous function
% Add epsilon to each axis and divide by f(x+eps,y) by epsilon
% Depends on gradAnon function

h   = zeros(2);
h(1,:) = (gradAnon(x+[eps 0],eps,f) - gradAnon(x,eps,f))/eps;
h(2,:) = (gradAnon(x+[0 eps],eps,f) - gradAnon(x,eps,f))/eps;


end