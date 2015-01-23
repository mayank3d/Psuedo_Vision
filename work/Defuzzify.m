function [n2,n3]=Defuzzify(k,handles)

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
disp('Defuzzified');
SetText('Defuzzified',handles);
