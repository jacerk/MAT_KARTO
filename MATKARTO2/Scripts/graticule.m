function [XM, YM, XP, YP] = graticule(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj)

    %Create graticule: list of meridians and parallels

    %Create list of meridian
    XM=[]; 
    YM=[];


    %Create list of parallels

    for v = vmin:Dv:vmax
        %Create meridian
        um = umin:du:umax;
        n = length(um);
        vm = ones(1, n)*v;
    
        %Convert to oblique aspect
        [sm, dm] = uv_sd(um, vm, uk, vk);

        %Compute xm, ym
        [xm, ym] = proj(R, sm, dm, 0);

        %Add meridian to the list
        XM = [XM; xm];
        YM = [YM; ym];

end   


XP=[]; YP=[];


    %Create list of parallels

    for u = umin:Du:umax
        %Create meridian
        vp = vmin:dv:vmax;
        n = length(vp);
        up = ones(1, n)*u;
    
        %Convert to oblique aspect
        [sp, dp] = uv_sd(up, vp, uk, vk);

        %Compute xp, yp
        [xp, yp] = proj(R, sp, dp, 0);

        XP = [XP; xp];
        YP = [YP; yp]; 
    end
end
