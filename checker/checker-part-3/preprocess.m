function [X y] = preprocess(path_to_dataset, histogram, count_bins)

	q = strcat(path_to_dataset,"cats/");
	imgs1 = getImgNames(q); 

	t = strcat(path_to_dataset,"not_cats/");
	imgs2 = getImgNames(t);

	[l1 u] = size(imgs1);
	[l2 u] = size(imgs2);
	X = zeros(l1+l2, count_bins*3);
	y = zeros(1,l1+l2);

	ok=0;
	if (strcmp(histogram,"RGB") == 1)
                  ok=1;
        endif
	if (strcmp(histogram,"HSV") == 1)
		  ok=2;
	endif

	if ( ok == 1 )
		for i=1:1:l1
			a = rgbHistogram(strcat(q,imgs1(i,:)), count_bins);
			X(i,:) = a;
			y(i)=1;
		endfor
		for i=1:1:l2
	                a = rgbHistogram(strcat(t,imgs2(i,:)), count_bins);
	                X(l1+i,:)=a;
	                y(l1+i)=-1;
		endfor	
	endif
	if ( ok == 2 )
		for i=1:1:l1
                        a = hsvHistogram(strcat(q,imgs1(i,:)), count_bins);
                        X(i, :) = a;
                        y(i)=1;
                endfor

                for i=1:1:l2
                        a = hsvHistogram(strcat(t,imgs2(i,:)), count_bins);
                        X(l1+i,:)=a;
                        y(l1+i)=-1;
                endfor
	endif	
	y=y';
endfunction
