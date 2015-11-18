% Author: Justice Amoh
% Description: Function to Compute Approximate Solution for Euclidean TSP
% Based on: http://www.mathworks.com/help/optim/ug/travelling-salesman-problem.html

%% PROBLEM 6


% H =[[0,1,0,2,0,0]; ...
%     [1,0,3,0,0,0]; ...
%     [0,3,0,1,0,1]; ...
%     [2,0,1,0,4,0]; ...
%     [0,0,0,4,0,8]; ...
%     [0,0,1,0,8,0]];

% load T;

function x = TSPa(T)

load T;
figure;
h=plot(graph(T));
h.NodeColor  = 'red';
title('Multigraph');

nStops = size(T,1);

idxs = nchoosek(1:nStops,2);
lendist = size(idxs,1);
dist = zeros(lendist,1);

for k=1:lendist
    dist(k) = T(idxs(k,1),idxs(k,2));
end

Aeq = spones(1:length(idxs));
beq = nStops;

Aeq = [Aeq;spalloc(nStops,length(idxs),nStops*(nStops-1))]; % allocate a sparse matrix
for ii = 1:nStops
    whichIdxs = (idxs == ii);                               % find the trips that include stop ii
    whichIdxs = sparse(sum(whichIdxs,2));                   % include trips where ii is at either end
    Aeq(ii+1,:) = whichIdxs';                               % include in the constraint matrix
end
beq = [beq; 2*ones(nStops,1)];

intcon = 1:lendist;
lb = zeros(lendist,1);
ub = ones(lendist,1);


% opts = optimoptions('intlinprog','Display','off');
[x_tsp,costopt,exitflag,output] = intlinprog(dist,intcon,[],[],Aeq,beq,lb,ub);
x = find(x_tsp);
path = idxs(x,:);

figure
EdgeTable = table(path,'VariableNames',{'EndNodes'});
h = plot(graph(EdgeTable));
h.NodeColor  = 'red';
h.MarkerSize = 6;
title('Solution with Subtours');


tours = detectSubtours(x_tsp,idxs);
numtours = length(tours); % number of subtours
fprintf('# of subtours: %d\n',numtours);






%% Subtour Constraints
A = spalloc(0,lendist,0);          
b = [];

while numtours > 1 % repeat until there is just one subtour
    % Add the subtour constraints
    b = [b;zeros(numtours,1)]; % allocate b
    A = [A;spalloc(numtours,lendist,nStops)]; % a guess at how many nonzeros to allocate
    for ii = 1:numtours
        rowIdx = size(A,1)+1;
        subTourIdx = tours{ii}; % Extract the current subtour
        variations = nchoosek(1:length(subTourIdx),2);
        for jj = 1:length(variations)
            whichVar = (sum(idxs==subTourIdx(variations(jj,1)),2)) & ...
                       (sum(idxs==subTourIdx(variations(jj,2)),2));
            A(rowIdx,whichVar) = 1;
        end
        b(rowIdx) = length(subTourIdx)-1; % One less trip than subtour stops
    end

    % Try to optimize again
    [x_tsp,costopt,exitflag,output] = intlinprog(dist,intcon,A,b,Aeq,beq,lb,ub);

    % How many subtours this time?
    tours = detectSubtours(x_tsp,idxs);
    numtours = length(tours); % number of subtours
    fprintf('# of subtours: %d\n',numtours);
%     pause();
end

x = find(x_tsp);
path = idxs(x,:);

figure
EdgeTable = table(path,'VariableNames',{'EndNodes'});
h = plot(graph(EdgeTable));
h.NodeColor  = 'red';
h.MarkerSize = 6;
title('Solution with Subtours Eliminated');
fprintf('Total costs: %.4f\n',costopt);



end









