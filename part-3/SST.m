function [x] = SST(A, b)
    [n,m] = size (A)
    n = min(n,m);
    x = zeros (n,1);
    x(n)=b(n)/A(n,n);
    for i=n-1 : -1 : 1 
        x(i)=(b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
    endfor
endfunction
    
