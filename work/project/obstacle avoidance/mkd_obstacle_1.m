clc;
clear all;
close all;

vid=videoinput('winvideo');            % Setting up video device
set(vid,'TriggerRepeat',inf);          % Configuring adapter
vid.FrameGrabInterval=10;              % Setting frame capture interval
vid_src=getselectedsource(vid);        % Setting up video source
set(vid_src,'Tag','Autobot');          % Setting attribute to the source
figure;                                % Opening image window
start(vid);                            % Starting image capture device


while(vid.FramesAcquired<=10)          % Stop after given frames 
    % clc;
    % close all;
data = getsnapshot(vid);               % Getting snapshot 
imshow(data);                          % Displaying snapshot in window
imwrite(data,'myobstacle.jpg');  


x=imread('myobstacle.jpg');
imview(x);
y=x;                                   % iy=143;
                                       % averaging
[ix,iy,iz]=size(x)

i=1;
loop=1;

    i=1;
while(i<=3)
    j=3;
    while(j<ix-3)
        k=3;
        while(k<iy-3)
            
            y(j,k,i)=y(j-1,k-1,i)/34+y(j-1,k,i)/34+y(j-1,k+1,i)/34+y(j,k-1,i)/34+y(j+1,k-1,i)/34+y(j,k+1,i)/34+y(j+1,k+1,i)/34+y(j+1,k,i)/34+y(j,k,i)/34;
            y(j,k,i)=y(j,k,i)*2;
            y(j,k,i)=y(j,k,i)+y(j-2,k-2,i)/34+y(j-2,k-1,i)/34+y(j-2,k,i)/34+y(j-2,k+1,i)/34+y(j-2,k+2,i)/34+y(j-1,k-2,i)/34+y(j-1,k+2,i)/34+y(j,k-2,i)/34+y(j,k+2,i)/34+y(j+1,k-2,i)/34+y(j+1,k+2,i)/34+y(j+2,k-2,i)/34+y(j+2,k-1,i)/34+y(j+2,k,i)/34+y(j+2,k+1,i)/34+y(j+2,k+2,i)/34;
            k=k+1;
        end;
        j=j+1;
    end;
    i=i+1;
end;
loop=loop+1;

imview(y);

%base point (160,225)- 142 146 125
base_x=106;
base_y=68;
y(base_x,base_y,1)
z=zeros(ix,iy);
    j=1;
    while(j<ix)
        k=1;
        while(k<iy)
            i=1;
            s=0;
            while(i<=3)
                if(y(base_x,base_y,i)<y(j,k,i))
                    r=abs(y(j,k,i)-y(base_x,base_y,i));
                else
                    r=y(base_x,base_y,i)-y(j,k,i);
                end;
                if(j==9 & k==310)
                    r=abs(r)
                end;
                s=double(s+r);
                i=i+1;
            end;
            
                if((255*((s-765)*(s-765)/(765*765)))<190)%value of 170 should be evaluated according to photo automatically
                    z(j,k)=0;
                else
                    z(j,k)=255;
                end;
            k=k+1;
         end;
     j=j+1;
     end;
       
imview(z);
%imwrite(z,'simple.jpg');

for i=1:287                           % Check every line from bottom and mke it dark as a black pixel is detected
    j=357; 
    f=1;
     while(f==1)
         if z(i,j)==0
            while(j~=0)
              z(i,j)=0;
              j=j-1;
            end
            f=0;
         end
     end
end



n0=0;
n1=0;
n2=0;

             
for i=1:287
    for j=1:351
        if k(i,j)==1
        n0=n0+i;                       % X co-ordinate for balanced pixel
        n1=n1+j;                       % Y co-ordinate for balanced pixel
        n2=n2+1;                       % Total pixels encounterd with intensity 1
        end 
    end
end
               if n2 ~= 0
               n0=n0/n2;               % Pixel co-ordinates to head to
               n1=n1/n2;
               end
                  

              disp('n0=');
              disp(n0);
              disp('n1=');
              disp(n1);
               
                                    %   Pass instruction to the driver circuit
                if n1<90
                    % Go left
                      putvalue(data1,[0 1 0 0 0 0 0 0]);
                      disp('Left');  
                    
                    
                elseif n1 > 180
                    % Go right
                      putvalue(data1,[0 0 0 1 0 0 0 0]);
                      disp('Right');  
                    
                else
                     putvalue(data1,[0 1 0 1 0 0 0 0]);
                     disp('Center');  
                    
                end
end
stop(vid);
close;