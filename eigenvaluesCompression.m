function[] = q3(input_image)
s = size(size(input_image)) ;
if s(2) > 2
    input_image = double(rgb2gray(input_image)) ;
else
    input_image = double(input_image) ;
end
input_image = input_image - 128 ;
[EMat , EVal] = eig(cov(input_image)) ;
compression_ratio = 0.06 ;
projected_image = input_image * EMat ;
s = size(projected_image) ;
projected_image(:,1:s(2)*compression_ratio) = 0 ;

compressed_image = projected_image * inv(EMat) ;

figure ;
subplot(1,2,1) ;
imshow(uint8(input_image)) ;
title('input image') ;

subplot(1,2,2) ;
imshow(uint8(compressed_image)) ;
title(strcat('compressed image k = ',num2str(compression_ratio))) ;

