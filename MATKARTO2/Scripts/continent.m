function[XC,YC] = continent(R, uk, vk, s0, proj, file)
    %Project continent in a specific projection
    
    %Load imput file
    P = load(file);

    %Extract its coordinates
    u = P(:,1)*pi/180;
    v = P(:,2)*pi/180;
        
    %Transform to oblique aspect
    [s, d] = uv_sd(u, v, uk, vk);
    
    %Treshold
    s_min = 5*pi/180; 

    %Preserve northern points
    %s = s(idxs); d = d(idxs);
    %idxs = find(s<=s_min);

    %Remove southern points
    idxs = find(s<=s_min);
    s(idxs) = []; d(idxs) = [];

    %Project points
    [XC, YC] = proj(R, s, d, s0);

end

   

    
