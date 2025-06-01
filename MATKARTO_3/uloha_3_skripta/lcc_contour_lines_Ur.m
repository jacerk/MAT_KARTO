clc
clear
hold on
axis equal
 
load('lcc_params_ur.mat','s1','s2','c','s0','Ro0');



%Pole
vk = -29.9196646*pi/180; 
uk = -54.9530408*pi/180;
s0 = 1.5337;
R = 1;

%Southern-most point
v2 = -30.8756775*pi/180;
u2 = -55.5705543*pi/180;

%Northern-most point
v1 = -34.4447926*pi/180;
u1 = -57.8253286*pi/180;

%Load points: Uruguay
N = load ("uruguay.txt");
u = N(:,2) * pi/180;
v = N(:,1) * pi/180;

%Convert to oblique aspect
[s, d] = uv_sd(u, v, uk, vk);
[s1, d1] = uv_sd(u1, v1, uk, vk);
[s2, d2] = uv_sd(u2, v2, uk, vk);

%Project Uruguay
[xn, yn] = lcc(R, s, d, s0, s1, s2);
plot(xn, yn, 'b', 'Linewidth', 0.8);

%Compute graticule
umin = -58.5*pi/180;
umax = -53*pi/180;
vmin = -37*pi/180;
vmax = -28*pi/180;
Du = 0.5*pi/180;
Dv = 0.5*pi/180;
du = 0.1*pi/180;
dv = 0.1*pi/180;

proj = @(R,s,d,s0) lcc(R, s, d, s0, s1, s2);

[XM, YM, XP, YP] = graticule(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj);
plot(XM', YM', 'k');    
plot(XP', YP', 'k');

%Mesh grid
[ug, vg] = meshgrid(umin:du:umax, vmin:dv:vmax);

%Convert to oblique aspect
[sg, dg] = uv_sd(ug, vg, uk, vk);

%Project meshgrid
[xg, yg] = lcc(R, sg, dg, s0, s1, s2);
%plot(xg, yg, 'o');

%Local linear scale
rho = Ro0 * ((tan(s0/2 + pi/4) ./ tan(sg/2 + pi/4)).^c);  
m = c .* rho ./ (R * cos(sg));
  


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