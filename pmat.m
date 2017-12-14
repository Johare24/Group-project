function [Pn] = pmat(kn,dx)
%PMAT Produces a Propagation Matrix for a given values of k and dx
%
Pn = [exp(-1i*kn*dx) 0; 0 exp(1i*kn*dx)];
end

