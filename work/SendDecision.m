function SendDecision(n3,n2,data1,handles)

if n3<90
    % Go right
    LeftTurn(data1,handles);
    pause(0.07);
    StopMotor(data1,handles);
                    
elseif n3 > 180
    % Go left
    
    RightTurn(data1,handles);  
    pause(0.1);
    StopMotor(data1,handles);
else
    % Go forward
    MoveForward(data1,handles);
    pause(0.1);
    StopMotor(data1,handles);
    
end