% Author: Justice Amoh
% Description: Function to check whether path P is eulerian in G

%% PROBLEM 2

function y = isapath(G,P)
    for k = 1:length(P)-1

        i = P(k);
        j = P(k+1);

        if (G(i,j)==0 || G(j,i)==0)
            y = 0;
            return;
        else
            G(i,j) = 0;
            G(j,i) = 0;
        end
    end

y = sum(G(:)) == 0;

end