function [ V ] = prodV(Bias, Xrange, steps)
%prodV returns an array describing the potential value at a certain bias.
%   Requires a bias to be defined, an array with minimum and maximum values
%   of x, along with the number of steps this potential is to be defined
%   at.
es = 1;
q = 1;
Nd = 1;
Vbuilt = 2.5;
x = linspace(Xrange(1), Xrange(2), steps);
D = sqrt((2*es/(q*Nd))*(Vbuilt - Bias));
V = ((q^2).*Nd/(2*es)).*(D-x).^2-(q^2./16*pi*es.*x);

end

