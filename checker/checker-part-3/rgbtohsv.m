
function [x] = rgbtohsv(p)
	
	r1 = p(1);
	g1 = p(2);
	b1 = p(3);
	r2 = r1/255;
	g2 = g1/255;
	b2 = b1/255;

	y = [r2 g2 b2];

	cmax = max(y);
	cmin = min(y);
  
	delta = cmax-cmin;
	if ( delta == 0 )
		h = 0;
	else
		if ( cmax == r2 )
			h = 60*(mod((g2-b2)/delta, 6));
		endif
		if ( cmax == g2 )
			h = 60*((b2-r2)/delta + 2);
		endif
		if ( cmax == b2 )
			h = 60*((r2-g2)/delta + 4);
		endif
	endif
	h = h/360;
	if ( cmax == 0 )
		s = 0;
	else
		s = delta/cmax;
	endif
  	x = [h s cmax];

endfunction
