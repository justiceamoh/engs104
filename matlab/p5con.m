% problem 5 constraints
function [c,ceq]=p5con(x)
c = [];

ceq(1) = x(1) + x(2) + x(3) -30;
ceq(2) = x(1)^2 + 2*x(2)^4 +3* x(3)^2 - 2;
ceq(3) = 2*(x(1)+40)^2 + (x(2)-30)^2 + (x(3)+20)^4 - 1;
end