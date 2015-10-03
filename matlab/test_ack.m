x = -5:0.1:5;
y = x;
z = zeros(length(x));
for i=1:length(x)
    for j=1:length(y), 
        z(i,j)=Ackley([x(i) y(j)]); 
    end
end
h1 = figure('Position',[242   257   941   416]);
subplot(1,2,1); surf(x,y,z)
colormap('winter')

subplot(1,2,2); contour(x,y,z,25)
hold

%% Gradient Descent
alpha = 0.01;           % Gradient Descent learn rate
delta = 0.001;          % Gradient step size, dt
niter = 20;             % Number of Iterations 
s     = [1.3 3.2];      % Initialization

gd = s;
for i=1:niter
    plot(gd(:,1),gd(:,2),'-*');
    s = s - alpha*gradAckley(s,delta);
    gd = [gd;s];
    pause(0.25);
end


%% Get Hessian
% H=HessAckley(s,eps);
