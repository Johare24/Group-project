function [Dn] = dmat(kn,knm1)
%DMAT Returns a scattering matrix, Dn given kn, kn-1
%
Dn = 0.5 * [(1 + kn/knm1) (1 - kn/knm1);(1-kn/knm1) (1+kn/knm1)];

end

