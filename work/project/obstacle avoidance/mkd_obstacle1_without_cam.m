clc;
clear all;
close all;


x=imread('obstacle.jpg');
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

for i=1:319
    j=239; 
    f=1;
     while(f==1)
         if z(i,j)==0
            while (j~=0)
              z(i,j)=0;
              j=j-1;
            f=0;
            end
            
         end
     end
end
imview(z);
close;