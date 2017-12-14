function [u, T] = fd(E, V, x, cPlt)
%FD returns a vector filled with wavefunctions evaluated at x_n
%   The fd function will use the transfer matrix method to numerically
%   evaluate the wavefunction "u", given a one dimensional barrier and an
%   energy value. The function returns a vector "u" containing the values
%   of the wavefunction evaluated at each step in x. The function also
%   returns a transmission probability, "T".
if nargin == 3
    cPlt = 0;
end
n = length(V);
h = max(x)/length(x); %Finds the length of each step in the barrier
k = sqrt(2*(E-V(1)));
Hs = zeros(n,n); %Initiates an n by n matrix
b = zeros(n,1); %Initiates boundary vector
b(1) = -2*1i*k(1)*exp(-1i*k(1)*x(1));
%Initial boundary equation-------------------------------------------------
Hs(1,1) = (-1/h) - 1i*k(1);
Hs(1,2) = 1/h;
%Final boundary equation---------------------------------------------------
k=sqrt(2*(E-V(n)));
Hs(n,n) = (-1/h) - 1i*k;
Hs(n,n-1) = 1/h;
%Central equations in the Hs matrix----------------------------------------
for it = 2:(n-1)
    Hs(it,it) = (1/(h^2)) + V(it) - E;
       Hs(it,it-1) = -1/(2*h^2);
       Hs(it,it+1) = -1/(2*h^2);
end
%u vector------------------------------------------------------------------
u = Hs\b;
C = u(end)* exp(1i*k(end)*x(end));
T = (abs(C)^2);
if(cPlt == 1)
    plot(x,u+E)
    xlabel('Distance / \mum')
    ylabel('Potential / E_{h}')
end
end

