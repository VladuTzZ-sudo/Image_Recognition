function [G_J, c_J] = Jacobi_factorization(A, b)
    U = tril(A);
    L = triu(A);
    [n n] = size(A);
    for i=1:1:n
        U(i,i)=0;
    endfor
    for i=1:1:n
        L(i,i)=0;
    endfor
    D=A;
    for j=1:1:n
        for i=1:1:n
            if ( i != j)
                D(i,j)=0;
            endif
        endfor    
    endfor
    D=inv(D);
    G_J = -D*(L+U);
    c_J = D*b;
    %c_J = c_J';
endfunction
