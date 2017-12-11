function [Vx, x] = barrier(Vbias, steps, cPlt)
%BARRIER Returns a potential function in x, for a Schottky Barrier given
%Bias Volatge
%   Barrier Function returns a potential function against x, modelled for a
%   schottky barrier, using (probably) atomic units. The final value in the
%   barrier will be a 0 as an approximation. To plot the wavefunction
%   further, extra zeros can be added to the end of the Vx potential as
%   long as the x array is adjusted accordingly.
if nargin == 2
    cPlt = 0;
end
q = 1;
e = 9.76/(4*pi);
V_bi = 0.025;
Nd = 3e-9;
D = sqrt(((2*e)/(q*Nd))*(V_bi - Vbias));
%Roots to find the turning point-------------------------------------------
a = (Nd*q^2)/e;
b = -D*((Nd*q^2)/e);
c = 0;
d = (q^2)/(16*pi*e);
Xs = roots([a b c d]);
%--------------------------------------------------------------------------
x = linspace(Xs(2),Xs(1), steps);
dx = max(x)/length(x);
Vx = (((q.^2*Nd)./(2*e))*(D-x).^2)/27.2;
Vx=flip(Vx);
x = [x]*1e-5; %converted -axis into atomic units
x(1) = 0;
Vx(end) = 0;
if(cPlt == 1)
    plot(X,Vx)
    xlabel('Distance into Barrier / \mum ')
    ylabel('Barrier Height / E_h')
end
end