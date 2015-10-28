% Author: Justice Amoh
% Description: ENGS 104 - Optimization: Assignment 2
% Date: 10/26/2015

%% PROBLEM 1
% Linear program in augmented form:
% $min_{x}c'*x$ such that $a*x=b, x \geq 0$.

% load file a2p1.mat with vars a, b and c.
load data/a2p1.mat

%%% Part A
% Which feasible solution has the largest value for $x_{23}$ ?
% $\max(f(x))= -\min(-f(x))$
f = zeros(size(c));
f(23) = -1;

Aeq = a;
beq = b;
lb  = 0;
x = linprog(f,[],[],Aeq,beq,lb);

%%% Part B
% Is there a basic feasible solution involving $x_{4}, x_{12}, x_{23}$ ?
f = zeros(size(c));
f(4)=1; f(12) = 1; f(23) = 1;

Aeq = a;
beq = b;
lb  = 0;
x = linprog(f,[],[],Aeq,beq,lb);

% *Answer* : Yeah, there is a feasible solution involving just $x_{4}, x_{12}, x_{23}$

%%% Part C
f   = c;
Aeq = a;
beq = b;
lb  = 0;
x = linprog(f,[],[],Aeq,beq,lb);



%% PROBLEM 2
%%% Part A - Infinity Norm
% *Question*: $\min_{y} \left \|y*a-c \right \|_{\infty}$
aa = a';
bb = c';

[n,m] = size(aa);
Aeq = [+aa -ones(n,1); ... 
       -aa -ones(n,1)];
beq = [bb ; -bb];

f   = [zeros(1,m) 1]; 
x   = linprog(f,[],[],Aeq,beq);   % check dimensionality


%%% Part B - L1 Norm
% *Question*: $\min_{u} \left \|u*a-c \right \|_{1}$
% for $\min_{u} \left \| u*a-b \right \|_{1}$
[n,m] = size(a);
Aeq = [+a -eye(n); ... 
       -a -eye(n)];
beq = [b ; -b];

f   = [zeros(1,m) ones(1,n)]; 
x   = linprog(f,[],[],Aeq,beq);   % check dimensionality

% for $\min_{u} \left \| u*a-c \right \|_{\1}$
aa = a';
bb = c';

[n,m] = size(aa);
Aeq = [+aa -eye(n); ...
       -aa -eye(n)];
beq = [bb ; -bb];

f    = [zeros(1,m) ones(1,n)]; 
x    = linprog(f,[],[],Aeq,beq);  
x_l1 = x(m+1:end);


%%% Part C
% *Question*: $\min_{z} \left \|z*a-c \right \|_{2}$
A = a';
b = c';

x_qp = quadprog( 2*(A'*A), -2*A'*b);


