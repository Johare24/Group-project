function [u] = fd(E, V, x, cPlt)
%FD returns a vector filled with wavefunctions evaluated at x_n
%   Detailed explanation goes here
if nargin == 3
    cPlt = 0;
end
n = length(V);
h = max(x)/length(x); %Finds the length of each step in the barrier

k = ev2k(E, V);

Hs = zeros(n,n); %Initiates an n by n matrix
b = zeros(n,1); %Initiates boundary vector

b(1) = -2*1i*k(1)*exp(-1i*k(1)*x(1));
%Initial boundary equation-------------------------------------------------

Hs(1,1) = (-1/h) - 1i*k(1);
Hs(1,2) = 1/h;
%Final boundary equation---------------------------------------------------

Hs(n,n) = (-1/h) - 1i*k(n);
Hs(n,n-1) = 1/h;
%Central equations in the Hs matrix----------------------------------------

for it = 2:(n-1)
    Hs(it,it) = 2/h^2 + V(it) - E;
    Hs(it,it+1) = -1/h^2;
    Hs(it,it-1) = -1/h^2;
end
%u vector------------------------------------------------------------------
u = Hs\b;
if(cPlt == 1)
    plot(x,u+E)
    xlabel('Distance / \mum')
    ylabel('Potential / E_{h}')
end

end

