function [T] = tm(E, V, x, cPlt)
%TM Runs a transfer matrix simulation for a given Energy and potential fn
%   Will return a vector of transmission probabilities given a range of
%   energies, a potential function and an a x range. Setting the final
%   argument to 1 will plot a figure of the particle energy vs transmission
%   probability. eg tm(E,V,x,1). 
if nargin == 2
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

