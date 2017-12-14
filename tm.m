function [T] = tm(E, V, x, cPlt)
%TM returns the Transmission Probabiliy, "T" for Energy "E" and a barrier V
%   The tm function will return a transmission probability T, given energy
%   E and potential barrier defined by V and x. E can be an array of values
%   or a single value and T will be returned as an array or a number
%   accordingly. This function uses the transfer matrix method to evaluate
%   the Transmission probabilities.
if nargin == 3
    cPlt = 0;
end
N = length(V);
nE = length(E);
steps=length(x);
dx = max(x)/steps;
T = zeros(nE);
for n = 1:length(E)
   k = ev2k(E(n),V);
   Q = dmat(k(N),k(N-1));
   for j = N-1:-1:2 
      Q = pmat(k(j), dx) * Q;
      Q = dmat(k(j),k(j-1)) * Q;
   end
   AP3 = 1/Q(1,1);
   T(n) = abs(AP3)^2;
end
if cPlt == 1
    plot(E, T) 
    xlabel('Particle Energy / E_h')
    ylabel('Transmission Probability')
end
end

