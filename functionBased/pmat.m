function [Pn] = pmat(kn,dx)
%PMAT Summary of this function goes here
%
Pn = [exp(-1i*kn*dx) 0; 0 exp(1i*kn*dx)];

end

