clc
clear
format long g

%Common parameters
proj = @gnom;
s0=0;
%Graticule
Du = 10*pi/180;
Dv = Du;
du = pi/180;
dv = du;
R = 6380*1000;

%Boundary points
us1 = 52.6226*pi/180;
uj1 = -us1;
us2 = 10.8123*pi/180;
uj2 = -us2;

%Face1
    %Input parametrs
    uk = -26.5651*pi/180;
    vk = 36*pi/180;
    umin = -70*pi/180;
    umax = 30*pi/180;
    vmin = -20*pi/180;
    vmax = 90*pi/180;
    
    %Boundary points(A,F,G,H,B,A)
    ub = [uj1,uj2,us2,uj2,uj1,uj1];
    vb = [0*pi/180, 0*pi/180, 36*pi/180, 72*pi/180, 72*pi/180, 0*pi/180];

    %globe face
    subplot(3,4,1);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);
    

%Face2
    %Input parametrs
    uk = 26.5651*pi/180;
    vk = 0*pi/180;
    umin = -30*pi/180;
    umax = 70*pi/180;
    vmin = -50*pi/180;
    vmax = 50*pi/180;

    %Boundary points(F,G,P,T,O,F)
    ub = [uj2, us2, us1, us1,us2, uj2];
    vb = [0*pi/180, 36*pi/180, 36*pi/180, 324*pi/180, 324*pi/180, 0*pi/180];

    %globe face
    subplot(3,4,2);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face3
    %Input parametrs
    uk = 26.5651*pi/180;
    vk = 72*pi/180;
    umin = -30*pi/180;
    umax = 70*pi/180;
    vmin = 30*pi/180;
    vmax = 120*pi/180;

    %Boundary points(H,I,Q,P,G,H)
    ub = [uj2, us2, us1, us1, us2, uj2];
    vb = [72*pi/180, 108*pi/180, 108*pi/180, 36*pi/180, 36*pi/180, 72*pi/180];

    %globe face
    subplot(3,4,3);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face4
    %Input parametrs
    uk = 26.5651*pi/180;
    vk = 144*pi/180;
    umin = -30*pi/180;
    umax = 70*pi/180;
    vmin = 90*pi/180;
    vmax = 200*pi/180;

    %Boundary points(J,K,R,Q,I,J)
    ub = [uj2, us2, us1, us1, us2, uj2];
    vb = [144*pi/180, 180*pi/180, 180*pi/180, 108*pi/180, 108*pi/180, 144*pi/180];

    %globe face
    subplot(3,4,4);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face5
    %Input parametrs
    uk = 26.5651*pi/180;
    vk = 216*pi/180;
    umin = -30*pi/180;
    umax = 70*pi/180;
    vmin = 160*pi/180;
    vmax = 270*pi/180;

    %Boundary points(L,M,S,R,K,L)
    ub = [uj2, us2, us1, us1, us2, uj2];
    vb = [216*pi/180, 252*pi/180, 252*pi/180, 180*pi/180, 180*pi/180, 216*pi/180];

    %globe face
    subplot(3,4,5);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face6
    %Input parametrs
    uk = 26.5651*pi/180;
    vk = 288*pi/180;
    umin = -30*pi/180;
    umax = 70*pi/180;
    vmin = 240*pi/180;
    vmax = 340*pi/180;

    %Boundary points(N,O,T,S,M,N)
    ub = [uj2, us2, us1, us1, us2, uj2];
    vb = [288*pi/180, 324*pi/180, 324*pi/180, 252*pi/180, 252*pi/180, 288*pi/180];
 
    %globe face
    subplot(3,4,6);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face7
    %Input parametrs
    uk = -26.5651*pi/180;
    vk = 108*pi/180;
    umin = -70*pi/180;
    umax = 30*pi/180;
    vmin = 50*pi/180;
    vmax = 160*pi/180;

    %Boundary points(B,C,J,I,H,B)
    ub = [uj1, uj1, uj2, us2, uj2, uj1];
    vb = [72*pi/180, 144*pi/180, 144*pi/180, 108*pi/180, 72*pi/180, 72*pi/180];
    
    %globe face
    subplot(3,4,7);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face8
    %Input parametrs
    uk = -26.5651*pi/180;
    vk = 180*pi/180;
    umin = -70*pi/180;
    umax = 30*pi/180;
    vmin = 120*pi/180;
    vmax = 230*pi/180;

    %Boundary points(C,D,L,K,J,C)
    ub = [uj1, uj1, uj2, us2, uj2, uj1];
    vb = [144*pi/180, 216*pi/180, 216*pi/180, 180*pi/180, 144*pi/180, 144*pi/180];
    
    %globe face
    subplot(3,4,8);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face9
    %Input parametrs
    uk = -26.5651*pi/180;
    vk = 252*pi/180;
    umin = -70*pi/180;
    umax = 30*pi/180;
    vmin = 200*pi/180;
    vmax = 300*pi/180;
   
    %Boundary points(D,E,N,M,L,D)
    ub = [uj1, uj1, uj2, us2, uj2, uj1];
    vb = [216*pi/180, 288*pi/180, 288*pi/180, 252*pi/180, 216*pi/180, 216*pi/180];
   
    %globe face
    subplot(3,4,9);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face10
    %Input parametrs
    uk = -26.5651*pi/180;
    vk = 324*pi/180;
    umin = -70*pi/180;
    umax = 30*pi/180;
    vmin = -100*pi/180;
    vmax = 20*pi/180;

    %Boundary points(E,A,F,O,N,E)
    ub = [uj1, uj1, uj2, us2, uj2, uj1];
    vb = [288*pi/180, 0*pi/180, 0*pi/180, 324*pi/180, 288*pi/180, 288*pi/180];

    %globe face
    subplot(3,4,10);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face11
    %Input parametrs
    uk = pi/2;
    vk = 0;
    umin = 50*pi/180;
    umax = 90*pi/180;
    vmin = -180*pi/180;
    vmax = 180*pi/180;

   
    %Boundary points(P,Q,R,S,T,P)
    ub = [us1, us1, us1, us1, us1, us1];
    vb = [36*pi/180, 108*pi/180, 180*pi/180, 252*pi/180, 324*pi/180, 36*pi/180];

   
    %globe face
    subplot(3,4,11);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%Face12
    %Input parametrs
    uk = -pi/2;
    vk = 0*pi/180;
    umin = -90*pi/180;
    umax = -50*pi/180;
    vmin = -180*pi/180;
    vmax = 180*pi/180;

    %Boundary points(A,B,C,D,E,A)
    ub = [uj1, uj1, uj1, uj1, uj1, uj1];
    vb = [0*pi/180, 72*pi/180, 144*pi/180, 216*pi/180, 288*pi/180, 0*pi/180];
  
    %globe face
    subplot(3,4,12);
    globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj, ub, vb)
    axis equal;
    axis([-0.6e7 0.6e7 -0.6e7 0.6e7]);

%renderer for vector export
set(gcf, 'Renderer', 'painters');

% Export SVG file
exportgraphics(gcf, 'vysledek.svg', 'ContentType', 'vector');