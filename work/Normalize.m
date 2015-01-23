function z=Normalize(y,handles)

z=imadjust(y);                         % Normalization
disp('Image Normalized');
SetText('Image Normalized',handles);
