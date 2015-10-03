x = -5:0.1:5;
y = x;
for i=1:length(x)
    for j=1:length(y), 
        z(i,j)=Ackley([x(i) y(j)]); 
    end
end
surf(x,y,z)
colormap('winter')
contour(x,y,z,25)
hold

%% Gradient Descent
alpha = 0.0001;
steps = 0.01;
s = [1.3 3.2];

for i=1:10000
    plot(s(1),s(2),'*');
    s = s - steps*gradAckley(s,alpha);
    pause;
end


%% Get Hessian
H=HessAckley(s,eps);
