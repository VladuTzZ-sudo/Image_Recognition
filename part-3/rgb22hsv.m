function [H S V] = rgb22hsv(i)
        i = double(i);
	[y u h] = size(i);

	r = i(:,:,1);
        g = i(:,:,2);
        b = i(:,:,3);
	r = r./255;
	g = g./255;
	b = b./255;

	cmin = zeros(y,u);
	H = zeros(y,u);
	S = zeros (y,u);
	V = zeros (y,u);
	delta = zeros (y,u);
	cmax = zeros(y,u);
	cmin = min(min(r, g), b);
	cmax = max(max(r, g), b);
	B = zeros ( y, u, h);

        delta = cmax-cmin;
	V = cmax;
	p=delta==0;
	H(p)=0;
	if ( delta  == 0 )
                H = 0;
		S = 0;
	else
		S = delta./cmax;

		a=cmax==r;
  		H(a)=60*mod((g(a)-b(a))./delta(a),6);
  		e=cmax==g;
		H(e)=60*((b(e)-r(e))./delta(e)+2);
		c=cmax==b;
		H(c)=60*((r(c)-g(c))./delta(c)+4);
  		H=H./360;
        endif

endfunction
