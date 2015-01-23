function y=ConvertToGray(x,handles)

y = .2989*x(:,:,1)...                  % Converting image into grayscale
    +.5870*x(:,:,2)...
    +.1140*x(:,:,3);

min(y(:))
ans =0;

max(y(:))
ans = 255;
    
colormap(gray(256)); 
SetText('Converted to gray',handles);
disp('Converted to gray');