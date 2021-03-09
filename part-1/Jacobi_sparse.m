function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
    n = size(G_rowptr);
    m = n(2) -1;
    x = zeros(1,m);
    x=x';
    while ( 2 > 0)
        y = csr_multiplication(G_values, G_colind, G_rowptr, x)
        if ( norm(y+c,2) - norm(x,2) >= tol )
            x = y + c;
        else

            break;
        endif
    endwhile
endfunction
