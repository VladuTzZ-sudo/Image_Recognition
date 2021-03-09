function [values, colind, rowptr] = matrix_to_csr(A)
        [n n] = size(A);
        values = zeros(1,1);
        colind = zeros(1,1);
	k=1;
        for i=1:1:n
    	   j = 1;
            while (j <= n)
  		if (A(i, j) != 0)
              	    values(1,k)=A(i, j);
               	    colind(1,k)=j;
		    k=k+1;
      		 endif
                j=j+1;
            endwhile
        endfor
            
        rowptr = zeros(1,n+1);
        
        i=1:1:k-1
            dubla(1,i)=values(1,i);
        
        p=1;
        t=1;
        for i=1:1:n
            j = 1;
            while (A(i,j) == 0 && j<=n)
                j=j+1;
            endwhile
            if ( A(i,j) != 0 )
                z=1;
                u=0;
                while ( z < k )
                    if ( dubla(1,z) ==  A(i,j) && u == 0)
                        dubla(1,z)=0;
                        rowptr(1,t)=z;
                        t = t + 1;
                        u = 1;
                        z = z + 1;
                    else
                        z = z + 1;
                    endif
                endwhile
            endif
            
            for j=1:n
                if(A(i,j) != 0)
                    dubla(1,p)=0;
                    p=p+1;
                endif
       	     endfor
        endfor
        rowptr(1,t)=k;A
        
endfunction
