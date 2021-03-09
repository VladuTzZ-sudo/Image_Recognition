function [A b] = generate_probabilities_system(rows)
    A = zeros(rows*(rows+1)/2);
    b = zeros(1,rows*(rows+1)/2);

    %colturi
    A(1,1)=4;
    A(1,2)=-1;
    A(1,3)=-1;
    b(1)=0;

    b(rows*(rows+1)/2-rows+1)=1;
    A(rows*(rows+1)/2-rows+1, rows*(rows+1)/2-rows+1)=4;
    A(rows*(rows+1)/2-rows+1, rows*(rows+1)/2-2*rows+2)=-1;
    A(rows*(rows+1)/2-rows+1, rows*(rows+1)/2-rows+2)=-1;

    b(rows*(rows+1)/2)=1;
    A(rows*(rows+1)/2,rows*(rows+1)/2)=4;
    A(rows*(rows+1)/2,rows*(rows+1)/2-rows)=-1;
    A(rows*(rows+1)/2,rows*(rows+1)/2-1)=-1;

    %margine stanga
    i=2;
    for k=2:1:rows-1
        A(i,i)=5;
        A(i,i-k+1)=-1;
        A(i,i+1)=-1;
        A(i,i+k)=-1;
        A(i,i+k+1)=-1;
        b(i)=0;
        i=i+k;
        n=i
    endfor

    %margine dreapta
    i=3;
    for k=2:1:rows-1
        A(i,i)=5;
        A(i,i-k)=-1;
        A(i,i-1)=-1;
        A(i,i+k+1)=-1;
        A(i,i+k)=-1;
        m=i
        b(i)=0;
        i=i+k+1;
    endfor

    %margine jos
    for i=rows*(rows+1)/2-rows+2:1:(rows*(rows+1)/2-1)
        A(i,i)=5;
        A(i,i-1)=-1;
        A(i,i+1)=-1;
        A(i,i-rows)=-1;
        A(i,i-rows+1)=-1;
        b(i)=1;
    endfor
    
    %interior
    k=3;
    for k=3:1:rows-1
        for i=(k*(k+1)/2-k+2):1:(k*(k+1)/2-1)
            A(i,i-k)=-1;
            A(i,i-k+1)=-1;
            A(i,i-1)=-1;
            A(i,i+1)=-1;
            A(i,i+k)=-1;
            A(i,i+k+1)=-1;
            A(i,i)=6;
            b(i)=0;
        endfor
    endfor
    b=b'
endfunction
