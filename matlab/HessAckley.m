function g = HessAckley(x,eps)
g = zeros(2);
% Approximate hessian by divided difference
% Add epsilon to each axis and divide by f(x+eps,y) by epsilon
g(1,:)=(gradAckley(x+[eps 0],eps) - gradAckley(x,eps))/eps;
g(2,:)=(gradAckley(x+[0 eps],eps) - gradAckley(x,eps))/eps;


end