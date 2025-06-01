clc
clear

format long g

%Input points, Equator
v1 = -31.371388*pi/180;
u1 = -59.2019872*pi/180;
v2 = -34.4076143*pi/180;
u2 = -52.9436432*pi/180;

%Southern-most point
v3 = -34.4430222*pi/180;
u3 = -57.8387836*pi/180;

%Northern-most point
v4 = -30.0864803*pi/180;
u4 = -56.8485328*pi/180;

%Pole
vk = atan2(tan(u1)*cos(v2)-tan(u2)*cos(v1), tan(u2)*sin(v1)-tan(u1)*sin(v2));
uk = atan2(-cos(v2-vk),tan(u2));

R = 1;
Ro0 = 0;

%Transform to oblique aspect
[s1, d1] = uv_sd(u1, v1, uk, vk);
[s2, d2] = uv_sd(u2, v2, uk, vk);
[s3, d3] = uv_sd(u3, v3, uk, vk);
[s4, d4] = uv_sd(u4, v4, uk, vk);

%True parallel
s0 = acos(2*cos(s4)/(1+cos(s4)));

%Local linear scales
m1 = cos(s0)/cos(s1)
m2 = cos(s0)/cos(s2)
m3 = cos(s0)/cos(s3)
m4 = cos(s0)/cos(s4)

%Distortions
mju1 = m1-1
mju2 = m2-1
mju3 = m3-1
mju4 = m4-1

%Distortions per km
mju1_km = mju1*1000
mju2_km = mju2*1000
mju3_km = mju3*1000
mju4_km = mju4*1000

save('mercator_params_urug.mat','s0','Ro0','uk','vk');
