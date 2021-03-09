function [w] = learn(X, y, lr, epochs)
  [l c]=size(X);
  w=gradient_descendent(X,l,y,lr,epochs)
endfunction
