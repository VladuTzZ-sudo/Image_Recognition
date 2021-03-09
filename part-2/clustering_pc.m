function [centroids] = clustering_pc(points, NC)
 
    [n d] = size(points);
    clusters = zeros( NC , 1 );
    centroids = zeros (NC, d); 
    for i=1:1:NC
        j=1;        
        k=i;    
        while ( k <= n )
            clusters(i,j)=k;
            j=j+1;
            k=k+NC;
        endwhile
    endfor
    
    for i=1:1:NC
        t = 1;
        while (clusters(i,t) + NC <= n)
            t++;
        endwhile
        for dim=1:1:d
            s = 0;
            for k=1:1:t
                p = clusters(i,k);
                s = s + points(p, dim);
            endfor
            centroids(i,dim)=s/t;
        endfor
    endfor
    grup = zeros ( NC, 1);
    f=0;
    while ( f == 0 )
        clusters=grup;
        grup = zeros( NC, 1);
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
            for dim=1:1:d
                s = 0;
                if ( r != 0 )
                    for k=1:1:r
                        p = grup(i,k);
                        s = s + points(p, dim);
                    endfor              
                    centroids(i,dim)=s/r;
                endif
            endfor
        endfor
    f = isequal(clusters,grup);
    endwhile
endfunction

