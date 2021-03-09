function [X y] = preprocess(path_to_dataset, histogram, count_bins)

	q = strcat(path_to_dataset,"cats/");
	imgs1 = getImgNames(q); 

	t = strcat(path_to_dataset,"not_cats/");
	imgs2 = getImgNames(t);

	[l1 u] = size(imgs1);
	[l2 u] = size(imgs2);
	X = zeros(l1+l2,count_bins*3);
	y = zeros(1,l1+l2);

	ok=0;
	if (strcmp(histogram,"RGB") == 1)
                  ok=1;
        endif
	if (strcmp(histogram,"HSV") == 1)
		  ok=2;
	endif

	for i=1:1:l1
		r = imgs1(i,:);
		p = strcat(q,r);
		if ( ok == 1 )
			a = rgbHistogram(p, count_bins);
		endif
		if ( ok == 2 )
			a = hsvHistogram(p, count_bins);
		endif
		X(i, :) = a;
		y(i)=1;
	endfor

	for i=1:1:l2
                r = imgs2(i,:);
                p = strcat(t,r);
                if ( ok == 1)
                        a = rgbHistogram(p, count_bins);
                endif
                if ( ok == 2)
                       a = hsvHistogram(p, count_bins);
               endif
                X(l1+i,:)=a;
                y(l1+i)=-1;
	endfor	
		
	
	for i=1:3*count_bins
	  X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
	endfor
	y=y';
endfunction
