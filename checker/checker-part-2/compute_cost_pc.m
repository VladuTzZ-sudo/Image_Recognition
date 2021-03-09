function [cost] = compute_cost_pc(points, centroids)
    [NC d]=size(centroids);
    [n d]=size(points);
    grup = zeros( NC, 1);
    cost=zeros(1,1);
    for i=1:1:n
        min=0;
        min = norm(points(i,:)-centroids(1,:));           
        j = 1;
        for k=1:1:NC
            norma = norm(points(i,:)-centroids(k,:));     
            if ( norma <= min )
                min = norma;
                j = k; 
            endif
        endfor
        u=size(grup);
        u=u(2);
        y=1;
        r=0;
        while (y <= u)
            if ( grup(j,y) == 0)
                    grup(j,y)=i;
                    r=1;
                    break;
            endif
            y=y+1;
        endwhile
        if ( r == 0 )
            grup(j,y)=i;
        endif
    endfor
    s=0;
    for i=1:1:NC
            [y u] = size(grup);
            y=1;
            r=0;
            while (y <= u)
                if ( grup(i,y) != 0)
                        r=r+1;
                endif
                y=y+1;
            endwhile
            if ( r != 0 )
                for k=1:1:r
                    p = grup(i,k);
                    s = s + norm(points(p,:)-centroids(i,:));
                endfor              
            endif
        endfor
       cost=s;
endfunction
