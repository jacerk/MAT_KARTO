clc
clear
hold on
axis equal


%Pole
load('mercator_params_urug.mat','s1','s2','c','s0','Ro0','uk','vk');
R = 1;

%Load points: Uruguay
N = load ("uruguay.txt");
u = N(:,2) * pi/180;
v = N(:,1) * pi/180;

%Convert to oblique aspect
[s, d] = uv_sd(u, v, uk, vk);

%Project Uruguay
[xn, yn] = mercator(R, s, d, s0, Ro0)
plot(xn, yn, 'b', 'Linewidth', 0.8);

%Compute graticule
umin = -58.5*pi/180 ;
umax = -53*pi/180;
vmin = -37*pi/180;
vmax = -28*pi/180;
Du = 0.5*pi/180;
Dv = 0.5*pi/180;
du = 0.1*pi/180;
dv = 0.1*pi/180;

proj = @(R,s,d,s0) mercator(R,s,d,s0,Ro0);

[XM, YM, XP, YP] = graticule(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj);
plot(XM', YM', 'k');    
plot(XP', YP', 'k');

%Mesh grid
[ug, vg] = meshgrid(umin:du:umax, vmin:dv:vmax);

%Convert to oblique aspect
[sg, dg] = uv_sd(ug, vg, uk, vk);

%Project meshgrid
[xg, yg] = mercator(R, sg, dg, s0, Ro0);
%plot(xg, yg, 'o');

%Local linear scale
m = cos(s0) ./ cos(sg);

%Distortion
mju = m-1;

%Distortions per km
mju_km = mju*1000;

%Contour lines
dz = 0.02;
[C, h] = contour(xg, yg, mju_km,[-50:dz:50], 'LineColor', 'r', 'Linewidth', 0.3);
[C, h] = contour(xg, yg, mju_km,[-50:dz*5:50], 'LineColor', 'r', 'Linewidth', 1.5);
clabel(C, h,'Color', 'red');

axis off