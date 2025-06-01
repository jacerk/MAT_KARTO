clc
clear
hold on
axis equal
format long

%Set Python interpreter
pyenv(Version="C:\Users\Monis\AppData\Local\Programs\Python\Python310\python.exe");

%Projection properties
proj_name = 'sinu';
%proj_name = 'bonne';
%proj_name = 'eck5';
%proj_name = 'wintri';
%proj_name = 'hammer';
R = 6380000;
%lat1 = 50;

%Test: project + extract arrays from tuple and convert to matrix
u = 50;
v = 15;
u0 = 50;
vals = py.mk.project(proj_name, R, u, v, u0)
x = double(vals{1});
y = double(vals{2});
a = double(vals{3});
b = double(vals{4});

%Analyzed territory
umin = -80*pi/180;
umax = 80*pi/180;
vmin = -180*pi/180;
vmax = 180*pi/180;
Du = 10*pi/180;
Dv = 10*pi/180;
du = 0.1 * Du;
dv = 0.1 * Dv;
uk = pi/2;
vk = 0;


%Mesh grid
[ug, vg] = meshgrid(umin:du:umax, vmin:dv:vmax);

%Test: project + extract arrays from tuple and convert to matrix
vals = py.mk.project(proj_name, R, py.numpy.array(ug  * 180/pi), py.numpy.array(vg*180/pi), u0);
XG = double(vals{1});
YG = double(vals{2});
a = double(vals{3});
b = double(vals{4});

%Airy Criterium (local)
h2a = ((a - 1).^2 + (b-1).^2)/2;

%Complex criterium (local)
h2c = (abs(a-1)+abs(b-1))/2 + a./b-1;

%Airy criterion (global)
H2a = mean(h2a(:))

%Complex criterion(global)
H2c = mean(h2c(:))

%Airy criterion(global, weighted)
w = cos(ug);
num = sum(w.*h2a);
den = sum(w);
H2aw = num/den

%Complex criterion (global, weighted)
w = cos(ug);
num = sum(w.*h2c);
den = sum(w);
H2cw = num/den

%Graticule
[XM, YM, XP, YP] = graticule_proj(umin-10*pi/180, umax+10*pi/180, vmin, vmax, Du, Dv, du, dv, R, uk, vk, u0, proj_name);
plot(XM', YM', 'k');    
plot(XP', YP', 'k');
axis off

%Load continents
file = "afr.txt";
A = load(file);
vals = py.mk.project(proj_name, R, A(:,1), A(:,2), u0)
XA = double(vals{1});
YA = double(vals{2});

plot(XA, YA, 'b');

%Compute variable map scale
M = 100000000;
Muv = M./a;

%Draw contour line
Mmin = 10000000;
Mmax = 100000000;
dM = 10000000;
[C, h] = contour(XG, YG, Muv, [Mmin:dM:Mmax], 'LineColor', 'r');
clabel(C, h,'Color', 'red'); 