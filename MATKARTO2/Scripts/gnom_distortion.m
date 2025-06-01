clc
clear
format long g

%Define symbolic variables
syms R u v

%Projection equations
x = R*tan(pi/2-u)*cos(v);
y = R*tan(pi/2-u)*sin(v);

%Partial derivatives
fu = diff(x, u);
fv = diff(x, v);
gu = diff(y, u);
gv = diff(y, v);

%Simplify equations
fu = simplify(fu, 'Steps', 20);
gu = simplify(gu, 'Steps', 20);

%Local linear scales
mp2 = (fu^2+gu^2)/R^2;
mp2 = simplify(mp2);
mr2 = (fv^2 + gv^2) / (R^2 *cos(u)^2);
mr2 = simplify(mr2, 'Steps', 10);
p = 2*(fu*fv+gu*gv);

%Angle between meridian and parallel
omega = atan((gu*fv - gv *fu)/p/2)*180/pi;
omega = simplify(omega,"Steps", 30)

%Area scale
P = (gu*fv - fu*gv)/(R^2 * cos(u));
P = simplify (P, 'Steps', 20);

% Meridian convergence
sigma = atan(gu/fu);
sigma = simplify (sigma, 'Steps', 50);
c = pi/2 - sigma
c = vpa(c)

%Extreme azimuths
A = atan2(p, mp2-mr2);
A = simplify (A, 'Steps', 50);

%Numeric computations
un = 52.6226 * pi/180;
vn = 36* pi/180;
Rn = 1;

%Coordinates
xn = double(subs(x, {R, u, v}, {Rn, un, vn}))
yn = double(subs(y, {R, u, v}, {Rn, un, vn}))

%Local linear scales
mpn = sqrt(double(subs(mp2, {R, u, v}, {Rn, un, vn})))
mrn = sqrt(double(subs(mr2, {R, u, v}, {Rn, un, vn})))
pn = double(subs(p, {R, u, v}, {Rn, un, vn}))

%Angle between meridian and parallel
omegan = double(subs(omega, {R, u, v}, {Rn, un, vn}))

%Delta omega
delta_omega =  2 * asin(abs(mrn - mpn)/(mrn + mpn)) * 180/pi

%Area scale
Pn = double(subs(P, {R, u, v}, {Rn, un, vn}))

%Meridian convergence
cn = double(subs(c, {R, u, v}, {Rn, un, vn}))
cn = cn*180/pi
%Extreme azimuths
A1ne = double(subs(A, {R, u, v}, {Rn, un, vn}));
A2ne = A1ne+ pi/2;

%Convergence
sigman = double(subs(sigma, {R, u, v}, {Rn, un, vn}));

%Extreme local linear scales
a2n = mpn^2 * cos(A1ne)^2 + mrn^2 * sin(A1ne)^2 + pn * sin(A1ne) * cos(A1ne);
b2n = mpn^2 * cos(A2ne)^2 + mrn^2 * sin(A2ne)^2 + pn * sin(A2ne) * cos(A2ne);
an = sqrt(a2n);
bn = sqrt(b2n);

%Tissote ellipse
scale = 0.1;
[xt, yt] = elipse_Tissot(scale*an, scale*bn, 0.1, xn, yn, sigman-A1ne);

%Graticule
umin = 45 *pi/180;
umax = 90*pi/180;
vmin = -180*pi/180;
vmax = 180*pi/180;

Du = 10*pi/180;
Dv = Du;
du = pi/180;
dv = du;

uk = 90*pi/180;
vk = 0*pi/180;

proj = @gnom;
u0 = 0;

%Create graticule
[XM, YM, XP, YP] = graticule(umin, umax, vmin, vmax, Du, Dv, du, dv,...
                                    Rn, uk, vk, u0, proj);
%Plot graticule
hold on;
plot(XM', YM', 'k');
plot(XP', YP', 'k');
axis equal

%Plot Tissot ellipse
plot(xt, yt);

function [xe, ye] = ellipse(a, b, dt)
%Create ellipse
    t = 0:dt:2*pi;
    xe = a*cos(t);
    ye = b*sin(t);
end

function [xer,yer] = rotate (xe,ye,fi)
    %Rotate points
    xer = cos(fi)*xe - sin(fi)*ye;
    yer = sin(fi)*xe + cos(fi)*ye;
end

function [xt, yt] = elipse_Tissot(a, b, dt, xs, ys,fi)
    %Create ellipse at [0,0]
    [xe, ye] = ellipse(a, b, dt);
    
    %Rotate ellipse by fi
    [xer,yer] = rotate (xe,ye,fi);

    %Shift ellipse
    xt = xer + xs;
    yt = yer + ys;
end







    
 