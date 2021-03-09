function [w]= gradient_descendent(X,N,y,lr,epochs)
a=-0.1;
b=0.1;
[l c]=size(X);
col = ones(l,1);
X = [X col];
w = (b-a).*rand(c+1,1) + a;
for epoch=1:epochs
  r=randperm(length(X),64);
  X_batch=X(r,:);
  Y_batch=y(r);
suma = 0;
%w=w';
for i=1:c+1
for j=1:64
  	suma = suma + dot((X_batch(j,:)*w)-Y_batch(j),X_batch(j,i));
      	endfor
%  w=w-((lr*X_batch(1:64,:)*w' - Y_batch(1:64))'*X_batch(1:64,i))/l;
	w(i) = w(i) - lr/l*suma; 
endfor

endfor
%w=w';
endfunction
