x = -5:0.1:5;
y = x;
for i=1:length(x)
    for j=1:length(y), 
        z(i,j)=Ackley([x(i) y(j)]); 
    end
end
surf(z)


%% Gradient Descent
alpha = 0.0001;
x = [1.3 3.2];
y = [0 0];

xnew = x - alpha*gradAckley(x,alpha)

% for i=1:1000, 
% [a,b] = gradAckley([1 1.2],0.000001);