clc;
clear all;
close all;

x=imread('str.jpg');             %read image
%imview(x);

                                 %convert to gray scale
y = .2989*x(:,:,1)...
    +.5870*x(:,:,2)...
    +.1140*x(:,:,3);
min(y(:))
ans =0;

max(y(:))
ans = 255;
    
    colormap(gray(256)); 
    imview(y);
    
%imhist(y);                      %histogram of converted image

                                %Normalization

z=imadjust(y);
z=edge(z);
imwrite(z,'after.jpg');