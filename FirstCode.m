h=1; %this is hbar, in atomic units$
m=1; %mass i natomic units%
E=1.5; %energy of the particle$
V=0; %barrier height%
d= 0.1; %barrier width%
k2=sqrt(2*m*(E-V)); %k1 will be k_j-1%
A3=1;
B3=1;
figure;
hold on;

for z=0:d:10
    x=linspace(z,z+d,150);
    
    A1=A3; %this is the A^+_j-1 term%
    B1=B3; %this is the A^-_j-1 term%
    k1=k2;
    y=(A1*exp(k1*x*1i))+(B1*exp(-k1*x*1i));
    
    plot(x,y,'blue');
    
    V=0; %barrier height%
    k2=sqrt(2*m*(E-V)); %k2 is the k_j term in the notes%
    k=(k2/k1);
    
    A2=(1/(2*k))*((k+1)*A1+(k-1)*B1); %These two equations are a rearrangement of%
    B2=(1/(2*k))*((k+1)*A1+(k-1)*B1); %the results of the scattering (D) matrix%
    
    A3=A2*exp(k2*d*1i); %This is the application of the P matrix%
    B3=B2*exp(-k2*d*1i);
    
    %only problem so far is I have not put in a way to change the barrier
    %height over multiple steps%
end

