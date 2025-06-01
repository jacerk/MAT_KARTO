function [x, y] = mercator(R, s, d, s0, Ro0)
    %Mercator projection
    %COmpute constant
	c = R .* cos(s0);
    
    %Projection equation
	x = -(c*d);
	y = -(R .* log(tan(s/2 + pi/4)));
end