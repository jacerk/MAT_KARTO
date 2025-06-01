clc
clear

format long g

%Input points, Equator
v1 = -22.1437606*pi/180;
u1 = -59.9029527*pi/180;
v2 = -56.1408647*pi/180;
u2 = -70.6497997*pi/180;

%Southern-most point
v3 = -36.8601637*pi/180;
u3 = -56.694113*pi/180;

%Northern-most point
v4 = -29.3230803*pi/180;
u4 = -70.0321267*pi/180;

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

save('mercator_params_arge.mat','s0','Ro0','uk','vk');
