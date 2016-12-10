close all;
clear all;

%% NACA 0012 %%
%% Define variables %%
V_inf = 50.00816327; %for reynolds 6E6, mu 1.021E-5, rho 1.176674
alpha = [-18,-17,-16,-15,-14,-13,-10,0,10,13,14,15,16,17,18];

%% NACA 0012 Experimental %%
EXP0012_alpha = [-4.04 -2.14 -.05 2.05 4.04 6.09 8.30 10.12 11.13 12.12 13.08 14.22 15.26 16.30 17.13 18.02 19.08];
EXP0012_Cl = [-.4417 -.2385 -.0126 .2125 .4136 .6546 .8873 1.0707 1.1685 1.2605 1.3455 1.4365 1.5129 1.5739 1.6116 .9967 1.1358];
EXP0012_Cd = [.00871 .00800 .00809 .00816 .00823 .00885 .01050 .01201 .01239 .01332 .01503 .01625 .01900 .02218 .02560 .18785 .27292];

%% NACA 0012 Fluent %%
Fluent0012_Cl = [-7.07E-01 -7.25E-01 -9.17E-01 -1.15E+00 -1.24E+00 -1.26E+00 -1.06E+00 -8.94E-06 1.06E+00 1.23E+00 1.24E+00 1.13E+00 8.81E-01 7.43E-01 7.06E-01];
Fluent0012_Cd = [1.90E-01 1.49E-01 1.13E-01 5.48E-02 3.66E-02 2.72E-02 1.35E-02 8.83E-03 1.38E-02 2.81E-02 3.24E-02 4.98E-02 1.19E-01 1.55E-01 1.93E-01];

%% NACA 0012 Vortex Panel Method %%
Vortex0012_Cl = [];
for i = 1:length(alpha)
    [x,y] = NACA_Airfoil(0/100,0/10,12/100,1,300); 
    [c_l,cl_u,xcc,Cp] = Vortex_Panel(x,y,V_inf,(pi/180)*alpha(i));
    Vortex0012_Cl = [Vortex0012_Cl,c_l];
end

%% NACA 0012 Thin Airfoil Theory %%
Thin0012_Cl = 2*pi*(pi/180)*alpha;

%% Plot alpha vs Cl and Cl vs Cd for NACA 0012 %%
set(0,'DefaultLineLineWidth',1.2)

figure(1)
hold on
plot(alpha,Fluent0012_Cl)
plot(alpha,Fluent0012_Cl,'o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 0012');
xlabel('\alpha (degrees)');
ylabel('C_L');
hold off

figure(2)
hold on
plot(Fluent0012_Cl,Fluent0012_Cd)
plot(Fluent0012_Cl,Fluent0012_Cd,'o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_D versus C_L for NACA 0012');
xlabel('C_L');
ylabel('C_D');
hold off

figure(3)
hold on
Fluent0012_ACl_Plot = plot(alpha,Fluent0012_Cl,'r');
Thin0012_ACl_Plot = plot(alpha,Thin0012_Cl,'b');
plot(alpha,Fluent0012_Cl,'r-o')
plot(alpha,Thin0012_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 0012');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent0012_ACl_Plot Thin0012_ACl_Plot],{'Turbulent RANS','Thin Airfoil Theory'},'Location','northwest')
hold off

figure(4)
hold on
Fluent0012_ACl_Plot = plot(alpha,Fluent0012_Cl,'r');
Vortex0012_ACl_Plot = plot(alpha,Vortex0012_Cl,'b');
plot(alpha,Fluent0012_Cl,'r-o')
plot(alpha,Vortex0012_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 0012');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent0012_ACl_Plot Vortex0012_ACl_Plot],{'Turbulent RANS','Vortex Panel Method'},'Location','northwest')
hold off

figure(5)
hold on
Fluent0012_ACl_Plot = plot(alpha,Fluent0012_Cl,'r');
EXP0012_ACl_Plot = plot(EXP0012_alpha, EXP0012_Cl,'b');
plot(alpha,Fluent0012_Cl,'r-o')
plot(EXP0012_alpha, EXP0012_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 0012');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent0012_ACl_Plot EXP0012_ACl_Plot],{'Turbulent RANS','Experimental'},'Location','northwest')
hold off

figure(6)
hold on
Fluent0012_ClCd_Plot = plot(Fluent0012_Cl,Fluent0012_Cd,'r');
EXP0012_ClCd_Plot = plot(EXP0012_Cl,EXP0012_Cd,'b');
plot(Fluent0012_Cl,Fluent0012_Cd,'r-o')
plot(EXP0012_Cl,EXP0012_Cd,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_D versus C_L for NACA 0012');
xlabel('C_L');
ylabel('C_D');
legend([Fluent0012_ClCd_Plot EXP0012_ClCd_Plot],{'Turbulent RANS','Experimental'},'Location','northwest')
hold off

%% NACA 4412 %%
%% Define variables %%
V_inf = 52.0632732601; %for reynolds 3E6, mu 2.04205E-5, rho 1.176674
alpha = [-13 -10 -8 -5 -4 -3 -2 -1 0 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18];

%% NACA 4412 Experimental %%
EXP4412_alpha = [-20 -16 -12 -8 -6 -4 -2 0 2 4 8 12 16 18 20 24 30];
EXP4412_Cl = [-0.545 -.742 -.732 -.374 -.211 -.0255 .146 .338 .501 .677 1.024 1.289 1.579 1.671 1.690 1.182 .913];
EXP4412_Cn = [-.592 -.767 -.722 -.372 -.210 -.0256 .146 .338 .501 .677 1.020 1.275 1.548 1.626 1.640 1.212 1.009];
EXP4412_Ca = [0.0318 -.0170 -.1264 -.0445 -.0151 .0043 .0107 .0098 -.0034 -.0258 -.1003 -.2043 -.3357 -.4040 -.4374 -.1838 -.0776];
EXP4412_Cd = [];
EXP4412_Cl2 = [];
for i = 1:length(EXP4412_alpha)
    EXP4412_Cd(i) = (EXP4412_Cn(i)*sind(EXP4412_alpha(i)) + EXP4412_Ca(i)*cosd(EXP4412_alpha(i)));
    EXP4412_Cl2(i) = (EXP4412_Cn(i)*cosd(EXP4412_alpha(i)) - EXP4412_Ca(i)*sind(EXP4412_alpha(i)));
end

%% NACA 4412 Fluent %%
Fluent4412_Cl = [-4.3691E-01 -6.4822E-01 -4.3848E-01 -1.0966E-01 1.93E-03 1.14E-01 2.25E-01 3.38E-01 5.6283E-01 6.7354E-01 7.8361E-01 8.9290E-01 1.0050E+00 1.1028E+00 1.2047E+00 1.3023E+00 1.3951E+00 1.5852E+00 1.6786E+00 1.7596E+00 1.8107E+00 1.8315E+00 1.8238E+00 1.6361E+00 1.5545E+00];
Fluent4412_Cd = [9.5603E-02 1.5460E-02 1.2755E-02 1.0696E-02 1.04E-02 1.02E-02 1.00E-02 1.02E-02 1.0646E-02 1.1040E-02 1.1522E-02 1.2135E-02 1.3282E-02 1.3828E-02 1.4085E-02 1.6231E-02 1.7643E-02 2.0943E-02 2.3625E-02 2.8010E-02 3.4807E-02 4.4262E-02 5.6286E-02 7.2912E-02 9.6072E-02];

%% NACA 4412 Vortex Panel Method %%
Vortex4412_Cl = [];
for i = 1:length(alpha)
    [x,y] = NACA_Airfoil(4/100,4/10,12/100,1,300); 
    [c_l,cl_u,xcc,Cp] = Vortex_Panel(x,y,V_inf,(pi/180)*alpha(i));
    Vortex4412_Cl = [Vortex4412_Cl,c_l];
end

%% NACA 4412 Thin Airfoil Theory %%
Thin4412_Cl = 2*pi*(alpha*pi/180 + (4.15*pi)/180);

%% Plot alpha vs Cl and Cl vs Cd for NACA 4412 %%
figure(7)
hold on
plot(alpha,Fluent4412_Cl)
plot(alpha,Fluent4412_Cl,'o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 4412');
xlabel('\alpha (degrees)');
ylabel('C_L');
hold off

figure(8)
hold on
plot(Fluent4412_Cl,Fluent4412_Cd)
plot(Fluent4412_Cl,Fluent4412_Cd,'o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_D versus C_L for NACA 4412');
xlabel('C_L');
ylabel('C_D');
hold off

figure(9)
hold on
Fluent4412_ACl_Plot = plot(alpha,Fluent4412_Cl,'r');
Thin4412_ACl_Plot = plot(alpha,Thin4412_Cl,'b');
plot(alpha,Fluent4412_Cl,'r-o')
plot(alpha,Thin4412_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 4412');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent4412_ACl_Plot Thin4412_ACl_Plot],{'Turbulent RANS','Thin Airfoil Theory'},'Location','northwest')
hold off

figure(10)
hold on
Fluent4412_ACl_Plot = plot(alpha,Fluent4412_Cl,'r');
Vortex4412_ACl_Plot = plot(alpha,Vortex4412_Cl,'b');
plot(alpha,Fluent4412_Cl,'r-o')
plot(alpha,Vortex4412_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 4412');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent4412_ACl_Plot Vortex4412_ACl_Plot],{'Turbulent RANS','Vortex Panel Method'},'Location','northwest')
hold off

figure(11)
hold on
Fluent4412_ACl_Plot = plot(alpha,Fluent4412_Cl,'r');
EXP4412_ACl_Plot = plot(EXP4412_alpha, EXP4412_Cl,'b');
plot(alpha,Fluent4412_Cl,'r-o')
plot(EXP4412_alpha, EXP4412_Cl,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_L versus \alpha for NACA 4412');
xlabel('\alpha (degrees)');
ylabel('C_L');
legend([Fluent4412_ACl_Plot EXP4412_ACl_Plot],{'Turbulent RANS','Experimental'},'Location','northwest')
hold off

figure(12)
hold on
Fluent4412_ClCd_Plot = plot(Fluent4412_Cl,Fluent4412_Cd,'r');
EXP4412_ClCd_Plot = plot(EXP4412_Cl,EXP4412_Cd,'b');
plot(Fluent4412_Cl,Fluent4412_Cd,'r-o')
plot(EXP4412_Cl,EXP4412_Cd,'b-o')
grid on,grid minor
set(gca,'fontsize',14)
title('C_D versus C_L for NACA 4412');
xlabel('C_L');
ylabel('C_D');
legend([Fluent4412_ClCd_Plot EXP4412_ClCd_Plot],{'Turbulent RANS','Experimental'},'Location','northwest')
hold off