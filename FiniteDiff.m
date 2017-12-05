
%Constants-----------------------------------------------------------------
h_bar = 1;
m = 1;
dx = 0.2;
h = dx;
Ne = 10;
Nv = length(U);
%Barrier-------------------------------------------------------------------
Vx = U/1000;%ones(Nv,1)*0.5;
%Particle------------------------------------------------------------------
E = linspace(0.01,0.5,Ne);
%Computation---------------------------------------------------------------
u = zeros(Nv,Ne);
hold on
for j = 1:length(E)
   Hs = zeros(Nv,Nv);  %Initialise main matrix
   k = sqrt(E(j)-Vx(1)); 
   b = zeros(Nv,1);
   b(1) = -2*1i*k*exp(-1i*k*0.05);
   %First Line of Matrix---------------------------------------------------
   Hs(1,1) = -1/h - 1i*k;
   Hs(1,2) = 1/h;
   %Last Line of Matrix----------------------------------------------------
   k=sqrt(E(j)-Vx(Nv));
   Hs(Nv,Nv) = 1i*k - 1/h;
   Hs(Nv,Nv-1) = 1/h;
   %Central Steps of Matrix -----------------------------------------------
   for l = 2:(length(Vx)-1)
       Hs(l,l) = (2/h^2) + Vx(l) - E(j);
       Hs(l,l-1) = -1/h^2;
       Hs(l,l+1) = -1/h^2;
   end
   u(:,j) = Hs\b;
   plot((1:Nv)*h,u(:,j))
end
xlabel('Distance into barrier, (nothing resembling a scale)')
ylabel('Wavefunction at x_i')