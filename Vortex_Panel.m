% This function finds the coefficient of pressure, sectional coefficient of
% lift, and the upper coefficient of lift through the vortex panel method


function [c_l,cl_u,xcc,Cp] = Vortex_Panel(x,y,V_inf,alpha)
%% Define variables %%
n=length(x)-1; % set panel number
M=zeros(n,2); % x and y points
S=zeros(n,1); % panel length
dydx=zeros(n,1); % slope
theta=zeros(n,1); % angle
for i=1:n
    M(i,:)=[(x(i+1,1)+x(i,1))/2,(y(i+1,1)+y(i,1))/2];
    S(i)=sqrt((x(i+1,1)-x(i,1))^2+(y(i+1,1)-y(i,1))^2);
    dydx(i)=(y(i+1,1)-y(i,1))/(x(i+1,1)-x(i,1));
    ds=[x(i+1,1)-x(i,1),y(i+1,1)-y(i,1)];
    theta(i)=atan2(ds(2),ds(1));
    RHS(i)=sin(theta(i)-alpha);
    clear ds
end

%% Create the System of Equations %%
CN1=zeros(n,n);
CN2=zeros(n,n);
CT1=zeros(n,n);
CT2=zeros(n,n);
for i=1:n
    for j=1:n
        if i==j
            CN1(i,j)=-1;
            CN2(i,j)=1;
            CT1(i,j)=pi/2;
            CT2(i,j)=pi/2;
        else
            A=-(M(i,1)-x(j,1))*cos(theta(j))-(M(i,2)-y(j,1))*sin(theta(j));
            B=(M(i,1)-x(j,1))^2+(M(i,2)-y(j,1))^2;
            C=sin(theta(i)-theta(j));
            D=cos(theta(i)-theta(j));
            E=(M(i,1)-x(j,1))*sin(theta(j))-(M(i,2)-y(j,1))*cos(theta(j));
            F=log(1+(S(j)^2+2*A*S(j))/B);
            G=atan2((E*S(j)),(B+A*S(j)));
            P=(M(i,1)-x(j,1))*sin(theta(i)-2*theta(j))+(M(i,2)-y(j,1))*cos(theta(i)-2*theta(j));
            Q=(M(i,1)-x(j,1))*cos(theta(i)-2*theta(j))-(M(i,2)-y(j,1))*sin(theta(i)-2*theta(j));
            CN2(i,j)=D+0.5*Q*F/S(j)-(A*C+D*E)*G/S(j);
            CN1(i,j)=0.5*D*F+C*G-CN2(i,j);
            CT2(i,j)=C+0.5*P*F/S(j)+(A*D-C*E)*G/S(j);
            CT1(i,j)=0.5*C*F-D*G-CT2(i,j);
        end
    end
end

%% Computing Influence Coefficients %%
AN = zeros(n+1,n+1);
AT = zeros(n+1,n+1);
for i=1:n
    AN(i,1) = CN1(i,1);
    AN(i,n+1) = CN2(i,n);
    AT(i,1) = CT1(i,1);
    AT(i,n+1) = CT2(i,n);
    for j=2:n
        AN(i,j) = CN1(i,j)+CN2(i,j-1);
        AT(i,j) = CT1(i,j)+CT2(i,j-1);
    end
end
AN(n+1,1) = 1;
AN(n+1,n+1) = 1;
RHS(n+1)=0;
for j=2:n
    AN(n+1,j)=0;
end

%% Calculate Cp, Velocity, Cl and Cl upper %%
RHS=RHS';
gamma=(AN\RHS);
V = zeros(n,1);
Cp = zeros(1,n);
for i=1:n
    v=0;
    for j=1:n+1
        v2=AT(i,j)*gamma(j);
        v=v+v2;
    end
    V(i)=cos(theta(i)-alpha)+v;
    Cp(i)=1-(V(i))^2;
end
Vt=V*V_inf; % velocity with vinf
gamma=sum(Vt.*S); % circulation
c=max(x)-min(x); % chord length
c_l=2*gamma/(V_inf*c); % calculation of cl
I1=(length(y)-1)/2+1; 
cl_u=trapz(x(I1:n),(Cp(I1:n)));
xc=M(:,1)/(max(x)-min(x));
xcc = xc/c;
end
        

        
            
            
            
            
            