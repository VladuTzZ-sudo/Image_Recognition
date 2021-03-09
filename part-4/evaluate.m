function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	[X y] = preprocess(path_to_testset, histogram, count_bins);
	pisici=0;
	caini=0;		
	[l c] = size(X);
	col = ones(l,1);
	[X] = [X col];	

	l1=1;
	while ( y(l1,1) == 1 )
		a=X(l1,:);
		a=a';
                z =dot(w, a);
		if ( z >= 0 )
			pisici = pisici + 1;
	
		else
			caini = caini + 1;	
		endif
		l1=l1+1;
        endwhile
        for i=l1+1:1:l
		a=X(i,:);
		a=a';
	        z = dot(w,a);
		if ( z < 0 )
			pisici = pisici + 1;
		else
			caini = caini + 1;
		endif
        endfor
	percentage = pisici / (pisici + caini)
endfunction
