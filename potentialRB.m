V_bi = linspace(-500, 0);
Nd = 1;
q = 1;
e = 0.977;
x = linspace(0,15);
V = abs(V_bi);
D = sqrt(((2*e)/(q*Nd)) * V);
U = ((q.^2 * Nd) / (2*e)) * (D-x).^2;
for n = 2:(length(U)-1)
    if(U(n)>U(n-1))
       U = U(1:n);
       break
    end
end
x = x(1:length(U));
plot(x,U);
