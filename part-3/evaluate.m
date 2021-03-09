function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	q = strcat(path_to_testset,"cats/");
        imgs1 = getImgNames(q);
        t = strcat(path_to_testset,"not_cats/");
        imgs2 = getImgNames(t);
        [l1 u] = size(imgs1);
        [l2 u] = size(imgs2);
	pisici=0;
	caini=0;
	for i=1:1:l1
                p=q;
                r = imgs1(i,:);
                p = strcat(p,r);
                if (strcmp(histogram,"RGB") == 1)
                        a = rgbHistogram(p, count_bins);
                endif
                if (strcmp(histogram,"HSV") == 1)
                        a = hsvHistogram(p, count_bins);
                endif
		a=a';
		[e o] = size(a);
                a(e+1)=1;
                y =dot(w, a);
		if ( y >= 0 )
			pisici = pisici + 1;
	
		else
			caini = caini + 1;	
		endif
        endfor
        for i=1:1:l2
                p=t;
                r = imgs2(i,:);
                p = strcat(p,r);
                if (strcmp(histogram,"RGB") == 1)
                        a = rgbHistogram(p, count_bins);
                endif
                if (strcmp(histogram,"HSV") == 1)
                        a = hsvHistogram(p, count_bins);
                endif
		a=a';
		[e o] = size(a);
		a(e+1)=1;
	        y = dot(w,a);
		if ( y < 0 )
			pisici = pisici + 1;
		else
			caini = caini + 1;
		endif
        endfor
	percentage = pisici / (pisici + caini)
endfunction
