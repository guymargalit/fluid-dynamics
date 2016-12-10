% This function constructs panels for a given NACA airfoil. It inputs the
% maximum camber, the location of maximum camber, the thickness, the
% chordlength, and the number of employed panels. The output involves the x
% and y locations of the boundary points.

function [x,y] = NACA_Airfoil(m,p,t,c,N)
A=zeros(2*N,2);
cx=zeros(N,c);
cy=zeros(N,c);
i=1;
for beta=linspace(0,180,N)
    Xc=(1+cosd(beta))/2;
    if Xc>=0 && Xc<p
        Yc=(m/(p^2))*(2*p*Xc-(Xc^2));
        dYc=(2*m/(p^2))*(p-Xc);
    elseif Xc>=p && Xc<=1
        Yc=(m/((1-p)^2))*(1-2*p+2*p*Xc-(Xc^2));
        dYc=(2*m/((1-p)^2))*(p-Xc);
    end
    cx(i,1)=Xc;
    cy(i,1)=Yc;
    Yt=(t/.2)*(0.2969*sqrt(Xc) - 0.1260*(Xc) - 0.3516*(Xc)^2 + 0.2843*(Xc)^3 - 0.1036*(Xc)^4);
    theta3=atand(dYc);
    Xu=Xc-Yt*sind(theta3);
    Yu=Yc+Yt*cosd(theta3);
    Xl=Xc+Yt*sind(theta3);
    Yl=Yc-Yt*cosd(theta3);
    A(i,:)=[Xl,Yl];
    A(2*N+1-i,:)=[Xu,Yu];
    i=i+1;
end
A(N,:)=[];
x = A(:,1);
y = A(:,2);
end
