function [g1,g2] = gradAckley(x,eps)

% Approximate gradient by divided difference
% Add epsilon to each axis and divide by f(x+eps,y) by epsilon
g1= (Ackley(x+[eps 0]) - Ackley(x))/eps;
g2= (Ackley(x+[0 eps]) - Ackley(x))/eps;


end