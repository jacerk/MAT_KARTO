clc
clear

format long g

R = 1;

%Pole
vk = -29.9196646*pi/180;
uk = -54.9530408*pi/180;

%Southern-most point
v2 = -30.8756775*pi/180;
u2 = -55.5705543*pi/180;

%Northern-most point
v1 = -34.4447926*pi/180;
u1 = -57.8253286*pi/180;

%Transform to oblique aspect
[s1, d1] = uv_sd(u1, v1, uk, vk);
[s2, d2] = uv_sd(u2, v2, uk, vk);

%Constant value c of projection (1)
cn = log(cos(s1))-log(cos(s2));
cd = log(tan(s2/2+pi/4))-log(tan(s1/2+pi/4));
c = cn/cd;
s0 = asin(c)

%Constant value rho0 of projection (1)
Ro0_n = 2*R*cos(s0)*cos(s1)*(tan(s1/2+pi/4))^c;
Ro0_d = c*(cos(s0)*(tan(s0/2+pi/4))^c + cos(s1)*(tan(s1/2+pi/4))^c);
Ro0 = Ro0_n/Ro0_d;

%Coordinates of P1, P2 in LCC
Ro1_n = (tan(s0/2 + pi/4)^c);
Ro1_d = (tan(s1/2 + pi/4)^c);
Ro1 = Ro0 * Ro1_n / Ro1_d;
Ro2_d = (tan(s2/2 + pi/4)^c);
Ro2 = Ro0 * Ro1_n / Ro2_d;

%Local linear scales
m1 = c*Ro1/(R*cos(s1));
m2 = c*Ro2/(R*cos(s2));
m0 = c*Ro0/(R*cos(s0));

%Distortions
mju1 = m1-1;
mju2 = m2-1;
mju0 = m0-1;

%Distortions per km
mju1_km = mju1*1000
mju2_km = mju2*1000
mju0_km = mju0*1000

%Save
save('lcc_params_ur.mat','s1','s2','c','s0','Ro0');