clear
%Constants-----------------------------------------------------------------
h_bar = 1;
dx = 15;
%Particle------------------------------------------------------------------
E = linspace(0.01,0.5,15000);
m = 1;
%Barrier-------------------------------------------------------------------
Vx = [0,0.1,0];
%Matrix Formation and Calculation
for j = 1:length(E)
   for n = 1:length(Vx)
       k(n) = sqrt(2*m*(E(j)-Vx(n))/h_bar);
       if(n ~= 1)
          %D(n,:,:) = 0.5 * [(1 + k(n)/k(n-1)) (1 - k(n)/k(n-1));(1-k(n)\k(n-1)) (1+k(n)/k(n-1))];
          A = 0.5 * [(1 + k(n)/k(n-1)) (1 - k(n)/k(n-1));(1-k(n)\k(n-1)) (1+k(n)/k(n-1))];
          if(n~=length(Vx))
             %P(n,:,:) = [exp(-1i*k(n)*dx) 0; 0 exp(1i*k(n)*dx)];
             B = [exp(-1i*k(n)*dx) 0; 0 exp(1i*k(n)*dx)];
          end
          if(n == 2)
             Q = A * B;
          elseif(n==length(Vx))
             Q = Q * A;
          else
             Q = Q * A * B;
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
