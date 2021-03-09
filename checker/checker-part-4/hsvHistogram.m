function [sol] = hsvHistogram(path_to_image,count_bins)

    i=imread(path_to_image);
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
	[h g] = size (s);
	s = s(:,g);
	s = s';
	sume = cumsum(histc(S, int),2);
	[h g]= size (sume);
	sume = sume(:,g);
	sume = sume';
	suume = cumsum(histc(V, int),2);
	[h g]= size(suume);
	suume = suume(:,g);
	suume =suume';
   
     sol=s;
     sol=[sol sume];
     sol=[sol suume]; 
     sol(count_bins+1)=[];
     sol(2*count_bins+1)=[];
     sol(3*count_bins+1)=[];
endfunction
