clear
%Situation Setup ----------------------------------------------------------
%A Single Particle introduced in the positive direction to a single step
%barrier of height V and width L, the units have been arbitraily applied to
%test
%Constants ----------------------------------------------------------------
hBar = 1;
N = 150; %Energy steps
%Barrier Properties -------------------------------------------------------
V = 0.1; %Barrier Height eV
L = [5,7,15]; %Barrier Length nm

%Particle Properties ------------------------------------------------------
E = linspace(0,0.5, N); %Incident particle energies eV
m = 1; %Mass taken as 1

%Calculation --------------------------------------------------------------

%Ap0 = 1; %coefficent for positive waves
%AnN = 0; %coefficient for negative waves
%k1 = sqrt(2*m*E)/hBar; %First region no barrier?
%k2 = sqrt(2*m*(E-V))/hBar; %Second Region 0.1eV
figure;
hold on
AP1 = 1;
AN3 = 0;
T = zeros(1,N);
for r = 1:3
    for n = 1:N
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
end 

