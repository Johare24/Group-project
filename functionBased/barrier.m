function [Vx, x] = barrier(Vbias, steps, cPlt)
%BARRIER Returns a potential function in x, for a Schottky Barrier given
%Bias Volatge
%   Barrier Function returns a potential function against x, modelled for a
%   schottky barrier, using (probably) atomic units
if nargin == 2
    cPlt = 0;
end
q = 1;
e = 1;
V_bi = 0.025;
Nd = 3e-9;
D = sqrt(((2*e)/(q*Nd))*(V_bi - Vbias));
a = (Nd*q^2)/e;
b = -D*((Nd*q^2)/e);
c = 0;
d = (q^2)/(16*pi*e);
dx = 0.012;
Xs = roots([a b c d]);
x = linspace(Xs(2)-dx,Xs(1), steps);
Vx = ((q.^2*Nd)./(2*e))*(D-x).^2 - (q.^2)./(16*pi*e*x);
if(cPlt == 1)
    plot([0 x],[0 Vx])
end
end

