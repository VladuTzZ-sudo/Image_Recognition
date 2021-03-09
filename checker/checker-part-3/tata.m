function [A B] = tata(A)
	[y u] = size(A);
	ioio = zeros(y, u);
	B = A < ioio
	if ( B == 1 )
		A = B - A;
	endif
endfunction
