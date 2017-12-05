clear
%Constants-----------------------------------------------------------------
h_bar = 1;
dx = 1;
%Particle------------------------------------------------------------------
E = linspace(0.01,0.5,15000);
m = 1;
%Barrier-------------------------------------------------------------------
Vx = [0,linspace(0.1,0.1,15),0];
%Matrix Formation and Calculation
for j = 1:length(E)
   for n = 1:length(Vx)
       k(n) = sqrt(2*m*(E(j)-Vx(n))/h_bar);
       if(n ~= 1)
          %D(n,:,:) = 0.5 * [(1 + k(n)/k(n-1)) (1 - k(n)/k(n-1));(1-k(n)\k(n-1)) (1+k(n)/k(n-1))];
          D = 0.5 * [(1 + k(n)/k(n-1)) (1 - k(n)/k(n-1));(1-k(n)\k(n-1)) (1+k(n)/k(n-1))];
          if(n~=length(Vx))
             P = [exp(-1i*k(n)*dx) 0; 0 exp(1i*k(n)*dx)];
          end
          if(n == 2)
             Q = D * P;
          elseif(n==length(Vx))
             Q = Q * D;
          else
             Q = Q * D * P;
          end
       end
   end
   AP3 = 1/Q(1,1);
   AP1 = Q(2,1)*AP3;
   
   T(j) = abs(AP3)^2;
end
plot(E, T)
xlabel('Particle Energy')
ylabel('Transmission Probability')
