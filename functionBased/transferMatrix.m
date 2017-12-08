clear
%Particle Energies
nE = 1000;
E = linspace(0.01, 0.5, nE);
%Barrier Properties
V = [0,linspace(0.1,0.1, 50),0];
N = length(V);
dx = 15/50;
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
