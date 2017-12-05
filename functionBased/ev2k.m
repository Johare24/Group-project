function [kn] = ev2k(E,V)
%EV2K Given a potential of V returns a k value
%   Given a potential V at point x in a one dimensional Barrier will return
%   a k value that can then be used to calculate scattering and propagation
%   matrices

%constants
m=1;
h_bar = 1;

kn = sqrt(2*m*(E - V)/h_bar);
end

