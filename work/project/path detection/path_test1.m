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
%imview(z);
%figure;
%imhist(z);                      %histogram of adjusted image


%edge detection---------------------------------------------------


for i=1:400
    for j=1:600
        if (z(i,j)<255)
            z(i,j)=z(i,j)+1;
        end
    end
end

 
for i=2:397
      for j=2:597
         
          t=0;
          for k=i-1:i+1
              for l=j-1:j+1
                  t=t+z(k,l);
              end
          end
         
%           u(i,j)=255-(((z(i-2,j-2)*-1)+(z(i-2,j-1)*-1)+(z(i-2,j)*-1)+(z(i-2,j+1)*-1)+(z(i-2,j+2)*-1)+(z(i+2,j-2)*-1)+(z(1+2,j-1)*-1)+(z(i+2,j)*-1)+(z(i+2,j+1)*-1)+(z(i+2,j+2)*-1)+(z(i-1,j-2)*-1)+(z(i-1,j+2)*-1)+(z(i,j-2)*-1)+(z(i,j+2)*-1)+(z(i+1,j-2)*-1)+(z(i+1,j+2)*-1)+(16*z(i,j)))/1);
           u(i,j)=255-(((z(i-1,j-1)*-1)+(z(i-1,j)*-1)+(z(i-1,j+1)*-1)+(z(i,j-1)*-1)+(z(i,j+1)*-1)+(z(i+1,j-1)*-1)+(z(i+1,j)*-1)+(z(i+1,j+1)*-1)+z(i,j)*8));
           %u(i,j)=cast(u(i,j)/t,'uint8');
           
      end
end

imview(u);
% edge detection over-----------------------------------------------

for i=2:396
      for j=2:596
         
                 
%           u(i,j)=255-(((z(i-2,j-2)*-1)+(z(i-2,j-1)*-1)+(z(i-2,j)*-1)+(z(i-2,j+1)*-1)+(z(i-2,j+2)*-1)+(z(i+2,j-2)*-1)+(z(1+2,j-1)*-1)+(z(i+2,j)*-1)+(z(i+2,j+1)*-1)+(z(i+2,j+2)*-1)+(z(i-1,j-2)*-1)+(z(i-1,j+2)*-1)+(z(i,j-2)*-1)+(z(i,j+2)*-1)+(z(i+1,j-2)*-1)+(z(i+1,j+2)*-1)+(16*z(i,j)))/1);
           v(i,j)=255-(((u(i-1,j-1)*-1)+(u(i-1,j)*-1)+(u(i-1,j+1)*-1)+(u(i,j-1)*-1)+(u(i,j+1)*-1)+(u(i+1,j-1)*-1)+(u(i+1,j)*-1)+(u(i+1,j+1)*-1)+u(i,j)*8));
           %u(i,j)=cast(u(i,j)/t,'uint8');
           
      end
end

imview(v);



