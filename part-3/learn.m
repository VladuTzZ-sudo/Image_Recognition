function [w] = learn(X, y)
	[l c] = size(X);
	X(:,c+1)=1;
	[Q R]=Householder(X, y);
	Q=Q';
	[l c] = size(Q);
	b = Q*y;		
	w = SST(R, b);
end
