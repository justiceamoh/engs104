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
[x,fval] = linprog(f,[],[],Aeq,beq,lb);

%%% Part B
% Is there a basic feasible solution involving $x_{4}, x_{12}, x_{23}$ ?
% Set $x_{4}, x_{12}, x_{23}$ to 1, all other unknowns to zero and run LP
f = zeros(size(c));
f(4)=1; f(12) = 1; f(23) = 1;

Aeq = a;
beq = b;
lb  = 0;
[x,fval] = linprog(f,[],[],Aeq,beq,lb);

% *Answer* : Yeah, there is a feasible solution involving just $x_{4}, x_{12}, x_{23}$

%%% Part C
f   = c;
Aeq = a;
beq = b;
lb  = 0;
[x,fval] = linprog(f,[],[],Aeq,beq,lb);



%% PROBLEM 2
%%% Part A - Infinity Norm
% *Question*: $\min_{y} \left \|y*a-c \right \|_{\infty}$
aa = a';
bb = c';

[n,m] = size(aa);
Aineq = [+aa -ones(n,1); ... 
         -aa -ones(n,1)];
bineq = [bb ; -bb];

f   = [zeros(1,m) 1]; 
[x,fval]   = linprog(f,Aineq,bineq,[],[]);   % check dimensionality
fprintf('Linfty Norm - Minimum value is: %.2f \n',fval)

%%% Part B - L1 Norm
% *Question*: $\min_{u} \left \|u*a-c \right \|_{1}$
aa = a';
bb = c';

[n,m] = size(aa);
Aineq = [+aa -eye(n); ...
         -aa -eye(n)];
bineq = [+bb ; -bb];

f    = [zeros(1,m) ones(1,n)]; 
[u,fval]  = linprog(f,Aineq,bineq,[],[]); 
fprintf('L1 Norm - Minimum value is: %.2f \n',fval)
x_l1 = u(m+1:end);


%%% Part C
% *Question*: $\min_{z} \left \|z*a-c \right \|_{2}$
A = a';
B = c';

z = A' * ((A*A')\ B);
fval = norm((A*z)-B,2);
fprintf('L2 Norm - Minimum value is: %.2f \n',fval);


%%% Part D
% *Question*: $\min_{w} \left \|w*a-c \right \|_{1}+\left \|w*a-c \right \|_{\infty}$
aa = a';
bb = c';

[n,m] = size(aa);
Aineq = [+aa -eye(n) zeros(n,1); ...
         -aa -eye(n) zeros(n,1); ...
         zeros(n,m) eye(n) -ones(n,1)];
bineq = [+bb ; -bb; zeros(n,1)];

f     = [zeros(1,m) ones(1,n) 1]; 
[w,fval]  = linprog(f,Aineq,bineq,[],[]); 
fprintf('L1 + Infinity Norm - Minimum value is: %.2f \n',fval)


%% PROBLEM 3
% *Question* Solve max-flow problem - Primal
Aeq = [ 1 -1  0 -1  0  0  0  0 ; ...
        0  0  0  0 -1  1 -1  0 ; ...
        0  1 -1  0  1  0  0  0 ; ...
        0  0  0  1  0  0  1 -1 ];

[n,m] = size(Aeq);    
beq = zeros(n,1);

A = eye(m);
b = [13  5  6  1  7 12  1  4]';

f  = zeros(1,m); f(1)=-1; f(6)=-1;
lb = 0;

[x_primal,fval] = linprog(f,A,b,Aeq,beq,lb);


%% PROBLEM 4
% *Question* Max-flow problem - Dual
Aeq = [ 1 -1  0 -1  0  0  0  0 ; ...
        0  0  0  0 -1  1 -1  0 ; ...
        0  1 -1  0  1  0  0  0 ; ...
        0  0  0  1  0  0  1 -1 ];
Aeq = -Aeq';
[n,m] = size(Aeq);

A = eye(m);
c = zeros(n,1); c(1)=-1; c(6)=-1;

b = [13  5  6  1  7 12  1  4]';
lb = 0;
% [x_dual, fval] = linprog(b,[],[],Aeq,c,lb);



%% PROBLEM 5
% Equality Constraints
% a = @(x) x(1) + x(2) + x(3) -30;
% b = @(x) x(1)^2 + 2*x(2)^4 +3* x(3)^2 - 2;
% c = @(x) 2*(x(1)+40)^2 + (x(2)-30)^2 + (x(3)+20)^4 - 1;
a = [1 1 1 0 0 0 0 0 0];
b = [0 0 0 1 1 1 0 0 0];
c = [0 0 0 0 0 0 1 1 1];

gfun = @p5con;

f = @(x) norm(a-b,2).^2 + norm(c-b,2).^2 + norm(a-c,2).^2;

x0 = [-2 1 0 1 4 1 1 2 3];
options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');
[x,fval] = fmincon(f,x0,[],[],[],[],[],[],gfun,options);

