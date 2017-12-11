%Main file to run for the simulation
clear
clf
%Energy of incoming particle-----------------------------------------------
E = [5 10 15];

%Potential Barrier---------------------------------------------------------

[V, x] = barrier(-500, 1000);
dx = max(x)/length(x);
ext = 50;
x = [x linspace(max(x)+dx, max(x)+ ext*dx, ext-1)];
V = [V zeros(1,ext-1)];
plot(x,V)
hold on
for j = 1:length(E)
    u = fd(E(j),V,x, 1);
end