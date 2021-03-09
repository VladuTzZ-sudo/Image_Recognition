function [sol] = hsvHistogram(path_to_image,count_bins)

    i=imread(path_to_image);
    [l c g]=size(i);
    hsvm=zeros(l ,c, 3);
    p = zeros (1,3);
    x = zeros (1,3);
    s=zeros(1,count_bins+1);
    sume=zeros(1,count_bins+1);
    suume=zeros(1,count_bins+1);
    int=zeros(1,count_bins+1);
    temp=1.01/count_bins;   
   
    k=0:1:count_bins;
    j=1:count_bins+1;
    int(j)=double(temp*k);

	[H S V] = rgb22hsv(i);
	s = cumsum(histc(H, int),2);
	[u h] = size(s);
	s = s(:,h);
	s = s';
	sume = cumsum(histc(S, int),2);
	[u h] = size(sume);
	sume = sume(:,h);
	sume = sume';
	suume = cumsum(histc(V, int),2);
	[u h] = size(suume);
	suume = suume(:,h);
	suume =suume';
   
     sol=s;
     sol=[sol sume];
     sol=[sol suume]; 
     sol(count_bins+1)=[];
     sol(2*count_bins+1)=[];
     sol(3*count_bins+1)=[];
endfunction
