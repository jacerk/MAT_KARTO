function [XM, YM, XP, YP] = graticule_proj (u_min, u_max,v_min, v_max, D_u, D_v, d_u, d_v, R, uk, vk, u0, proj_name)
%Create graticule

%Create meridians
XM = []; YM = [];
for v = v_min : D_v :v_max

    %Meridian
    um = u_min : d_u :u_max;
    m = length(um);
    vm = repelem(v, 1, m);

    %Convert to oblique aspect
    [sm, dm] = uv_sd(um, vm, uk, vk);

    %Project a meridian
    vals = py.mk.project(proj_name, R, sm * 180 / pi, dm * 180 / pi, u0);

    %Extract arrays from tuple and convert to matrix
    xm = double(vals{1});
    ym = double(vals{2});
    
    %add meridian
    XM = [XM;xm];
    YM = [YM;ym];
end

%Create parallels
XP = []; YP = [];
for u = u_min : D_u :u_max

    %Parallel
    vp = v_min : d_v :v_max;
    n = length(vp);
    up = repelem(u, 1, n);

    %Convert to oblique aspect
    [sp, dp] = uv_sd(up, vp, uk, vk);

    %Project a parallel
    vals = py.mk.project(proj_name, R, sp * 180 / pi, dp * 180 / pi, u0);

    %Extract arrays from tuple and convert to matrix
    xp = double(vals{1});
    yp = double(vals{2});
    
    %Add meridian
    XP = [XP; xp];
    YP = [YP; yp];
end
