function [sol] = rgbHistogram(path_to_image,count_bins)
    i = imread(path_to_image);

    temp=256/count_bins;
    s=zeros(1,count_bins+1);
    sume=zeros(1, count_bins+1);
    suume=zeros(1, count_bins+1);
    int=zeros(1,count_bins+1);
    sol=zeros(1,count_bins+1);

    k=0:1:count_bins;
    j=1:count_bins+1;
    int(j)=double(temp*k);

        s = cumsum(histc(i(:,:,1), int),2);
        [h g] = size (s);
	s = s(:,g);
        s = s';
        sume = cumsum(histc(i(:,:,2), int),2);
	[h g] = size ( sume);
        sume = sume(:,g);
        sume = sume';
        suume = cumsum(histc(i(:,:,3), int),2);
	[h g] = size (suume);
        suume = suume(:,g);
        suume =suume';
    
    sol=s;
    sol=[sol sume];
    sol=[sol suume];
    sol(count_bins+1)=[];
    sol(2*count_bins+1)=[];
    sol(3*count_bins+1)=[];
endfunction
