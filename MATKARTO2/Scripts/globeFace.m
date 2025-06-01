function [] = globeFace(umin, umax, vmin, vmax, Du, Dv, du, dv, R,...
                        uk, vk, s0, proj, ub, vb)

    %graticule
    [XM, YM, XP, YP] = graticule(umin, umax, vmin, vmax, Du, Dv, du, dv, R, uk, vk, s0, proj);
    
    %plot results graticule
    hold on;
    plot(XM', YM','k');
    plot(XP', YP','k');
    axis equal

    %draw continent
    s0=0;
    file = "C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\matlab\U2\continents_points\eur.txt";
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC, 'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\amer.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % % Draw continent
    % s0 = 0;
    % file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\anta.txt';
    % [XC, YC] = continent(R, uk, vk, s0, proj, file);
    % plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\austr.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');
    
    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\afr_mad.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\antar.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\greenl.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\newzel1.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\newzel2.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\tasm.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');

    % Draw continent
    s0 = 0;
    file = 'C:\Users\Monis\Documents\Mgr\2_SEMESTR\MAT_KARTO\u2\globy\continents_points\afr.txt';
    [XC, YC] = continent(R, uk, vk, s0, proj, file);
    plot(XC, YC,'b');


    %draw boundary
    [XB,YB] = boundary(R, uk, vk, s0, proj, ub, vb);
    %cutting lines
    plot(XB, YB, 'r');

end