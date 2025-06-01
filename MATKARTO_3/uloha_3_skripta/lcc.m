function [x, y] = lcc(R, s, d, s0, s1, s2)
    %Lambert Conformal Conic projection
	%Compute constant
    cn = log(cos(s1))-log(cos(s2));
    cd = log(tan(s2/2+pi/4))-log(tan(s1/2+pi/4));
    c = cn/cd;
   
    Ro0_n = 2*R*cos(s1)*cos(s2)*tan(s2/2+pi/4)^c;
    Ro0_d = c*(cos(s1)*tan(s1/2+pi/4)^c+cos(s2)*tan(s2/2+pi/4)^c);
    Ro0 = Ro0_n/Ro0_d;
    
    %Projection equations
    ro = Ro0*(((tan(s0/2 + pi/4))./(tan(s/2 + pi/4))).^c);
	eps = c*d;
	
    x = ro .* sin(eps);
	y = -ro .* cos(eps);
end