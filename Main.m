%Main.m is the file used to run the calculation, this collects all the
%methods together and can be used to compare values and produce graphs.
%Usage---------------------------------------------------------------------
%The function fd takes arguments [u, T] = fd(E,V,x,cPlt). cPlt is an
%optional argument which will takes values of 0 or 1. If 1, fd will produce
%a plot of the Wavefunction against x.
%The tm function is used as [T] = tm(E,V,x,cPlt). The cPlt works in the
%same way as above
%--------------------------------------------------------------------------
clear
clf
%Energy of incoming particle-----------------------------------------------
E = [5 10 15];
%Potential Barrier---------------------------------------------------------
[V, x] = barrier(-500, 1000);
dx = max(x)/length(x);
ext = 400;
V = [V zeros(1,ext)];
x = [x linspace(x(end)+dx,x(end)+ext*dx,ext)];
plot(x,V)
%Plotting of Wavefunction Using Finite Difference--------------------------
hold on
for j = 1:length(E)
    [u, Tfd(j)] = fd(E(j),V,x, 1);
    Ttm(j) = tm(E(j), V, x);
end
%Displaying Transmission Probabilities from finite difference--------------
disp('Incident Energies:')
disp(E)
disp('Transmission Probabilities - Finite Difference Method:')
disp(Tfd)
%Displaying Transmission Probabilities from Transfer Matrix----------------
disp('Transmission Probabilities - Transfer Matrix Method')
disp(Ttm)