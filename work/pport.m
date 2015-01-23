clc;
clear all;
close all;

DIO = digitalio('parallel','LPT1');
data1 = addline(DIO,0:7,0,'out'); %Pin 2-9
data2 = addline(DIO,0,2,'out'); %Pin 1
data3 = addline(DIO,1,2,'out') ;%Pin 14

vid=videoinput('winvideo');            % Setting up video device
set(vid,'TriggerRepeat',inf);          % Configuring adapter
vid.FrameGrabInterval=10;              % Setting frame capture interval
vid_src=getselectedsource(vid);        % Setting up video source
set(vid_src,'Tag','Autobot');          % Setting attribute to the source
figure;                                % Opening image window
start(vid);                            % Starting image capture device


while(vid.FramesAcquired<=100)          % Stop after 100 frames 
   % clc;
   % close all;
data = getsnapshot(vid);               % Getting snapshot 
imshow(data);                          % Displaying snapshot in window
imwrite(data,'mkd.jpg');               % Saving and overwriting captured images in matlab works


x=imread('mkd.jpg');                   % Reading captured image from matlab works
y = .2989*x(:,:,1)...                  % Converting image into grayscale
    +.5870*x(:,:,2)...
    +.1140*x(:,:,3);
min(y(:))
ans =0;

max(y(:))
ans = 255;
    
    colormap(gray(256)); 
 %   imview(y);
    
 %   imhist(y);                        % Histogram of converted image
  
                                       
z=imadjust(y);                         % Normalization


%imview(z);                            % Display after normalizing

k=edge(y);                             % Sobel edge detection by default
%imview(k);                             % Display image after getting edges 

n0=0;
n1=0;

for i=1:287
    for j=1:351
        if j<175
            n0=n0+k(i,j);
        elseif j>175
            n1=n1+k(i,j);
                    end
    end
end
                    disp(n0);          % Test of no of pixels on right and left side of screen
                    disp(n1);

        n2=0;
        n3=0;
        n4=0;
        
for i=1:287
    for j=1:351
        if k(i,j)==1
        n2=n2+i;                       % X co-ordinate for balanced pixel
        n3=n3+j;                       % Y co-ordinate for balanced pixel
        n4=n4+1;                       % Total pixels encounterd with intensity 1
        end 
    end
end
               if n4 ~= 0
               n2=n2/n4;               % Pixel co-ordinates to head to
               n3=n3/n4;
               end
                  

              disp('n2=');
              disp(n2);
              disp('n3=');
              disp(n3);
               
                                    %   Pass instruction to the driver circuit
                if n3<90
                    % Go left
                    
                     %setup camera


                    putvalue(data1,[0 1 0 0 0 0 0 0]);
                      disp('right');  
                    
                    
                elseif n3 > 180
                    % Go right
                    
                       %setup camera



                    putvalue(data1,[0 0 0 1 0 0 0 0]);
                     disp('left');  
                    
                else
                    % G
                     %setup camera
  


                    putvalue(data1,[0 1 0 1 0 0 0 0]);
                     disp('center');  
                    
                end

end
stop(vid);                             % Stop image source




