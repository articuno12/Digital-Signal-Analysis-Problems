function[image] = DenoiseTwigs( Name )
input = imread(Name) ;
inputdouble=im2double(input);
imageRchannel = inputdouble(:,:,1) ;
imageGchannel = inputdouble(:,:,2) ;
imageBchannel = inputdouble(:,:,3) ;

FFTRchannel = fftshift(fft2(imageRchannel)) ;
FFTGchannel = fftshift(fft2(imageGchannel)) ;
FFTBchannel = fftshift(fft2(imageBchannel)) ;

filter = ones(253,256);
for i=127:131
for j=1:88
filter(j,i)=0;
end
end
for i=169:256
for j=125:129
filter(j,i)=0;
end
end
for i=127:131
for j=165:253
filter(j,i)=0;
end
end
for i=1:90
for j=125:130
filter(j,i)=0;
end
end

outputRchannel = ifft2(ifftshift(FFTRchannel .* filter)) ;
outputGchannel = ifft2(ifftshift(FFTGchannel .* filter)) ;
outputBchannel = ifft2(ifftshift(FFTBchannel .* filter)) ;
image = abs(cat(3,outputRchannel,outputGchannel,outputBchannel)) ;
