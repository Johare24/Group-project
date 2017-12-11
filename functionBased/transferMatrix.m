clear
%Particle Energies
nE = 1000;
E = linspace(0.1, 5, nE);
%Barrier Properties
[V, x] = barrier(-5,100);
N = length(V);
dx = 7/100;
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
plot(E, T)
xlabel('Particle Energy')
ylabel('Transmission Probability')
