function[XB,YB] = boundary(R, uk, vk, s0, proj, ub, vb)
    %Draw boundary lines (cuttings edges)

    %Transform to oblique aspect
    [sb, db] = uv_sd(ub, vb, uk, vk);
   
    %Treshold
    s_min = 45*pi/180; 

    %Project points
    [XB, YB] = proj(R, sb, db, s0);
end