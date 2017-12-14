function [Vx, x] = barrier(Vbias, steps, cPlt)
%BARRIER Returns a potential function in x, for a Schottky Barrier given
%Bias Volatge
%   Barrier Function returns a potential function against x, modelled for a
%   schottky barrier, using atomic units
if nargin == 2
    cPlt = 0;
end
q = 1;
e = 9.76/(4*pi);
V_bi = 0.025;
Nd = 3e-9;
D = sqrt(((2*e)/(q*Nd))*(V_bi - Vbias));
%Roots to find the turning point to find the correct region of the function
a = (Nd*q^2)/e;
b = -D*((Nd*q^2)/e);
c = 0;
d = (q^2)/(16*pi*e);
Xs = roots([a b c d]);
%Calculation of the Barrier in the appropriate region----------------------
x = linspace(Xs(2),Xs(1), steps);
Vx = (((q.^2*Nd)./(2*e))*(D-x).^2)/27.2;
Vx=flip(Vx);
x = x*1e-5; %converted x-axis into atomic units
x(1) = 0;
Vx(end) = 0;
if(cPlt == 1)
    plot(X,Vx)
    xlabel('Distance into Barrier / \mum ')
    ylabel('Barrier Height / E_h')
end
end