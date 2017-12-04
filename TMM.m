clear
%Situation Setup ----------------------------------------------------------
%A Single Particle introduced in the positive direction to a single step
%barrier of height V and width L, the units have been arbitraily applied to
%test
%Constants ----------------------------------------------------------------
hBar = 1;
N = 15000; %Energy steps
M = 3; %Number of differnt lengths for the barrier to be tested at
barrierMin = 5; %Minimum length for the barrier
barrierMax = 15; %Maximum length for the barrier
%Barrier Properties -------------------------------------------------------
V = 0.1; %Barrier Height eV
%L = linspace(barrierMin,barrierMax,M);
L = 15;
%Particle Properties ------------------------------------------------------
E = linspace(0.01,0.5, N); %Incident particle energies eV
m = 1; %Mass taken as 1 for simplicity

%Calculation --------------------------------------------------------------

figure;
hold on
AP1 = 1;
AN3 = 0;
T = zeros(1,length(E));
for r = 1:length(L)
    for n = 1:length(E)
        k1 = sqrt(2*m*E(n))/hBar;
        k2 = sqrt(2*m*(E(n) - V))/hBar;
        k3 = k1;
        %Define Diffraction and Propogation Matrices
        D2 = 0.5 * [(1+k2/k1) (1-k2/k1); (1-k2/k1) (1+k2/k1)];
        P2 = [exp(-1i*k2*L(r)) 0; 0 exp(1i*k2*L(r))];
        D3 = 0.5 * [(1+k3/k2) (1-k3/k2); (1-k3/k2) (1+k3/k2)];

        Q = D2 * P2 * D3; %Transfer Matrix

        AP3 = 1/Q(1,1); 
        AP1 = Q(2,1)*AP3;

        T(n) = abs(AP3)^2; %Transmission probability
    end
    plot(E, T)
    ylabel('Transmission Probability')
    xlabel('Particle Energy')
    Q
end 

