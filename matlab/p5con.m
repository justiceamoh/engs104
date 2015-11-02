% problem 5 constraints
function [c,ceq]=p5con(x)
c = [];

ceq(1) = x(1) + x(2) + x(3) -30;
ceq(2) = x(4)^2 + 2*x(5)^4 +3* x(6)^2 - 2;
ceq(3) = 2*(x(7)+40)^2 + (x(8)-30)^2 + (x(9)+20)^4 - 1;
end