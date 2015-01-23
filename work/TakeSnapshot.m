function TakeSnapshot(vid,handles)

% % vid=ConfigureVid();
% vid=videoinput('winvideo');            % Setting up video device
% set(vid,'TriggerRepeat',inf);          % Configuring adapter
% vid.FrameGrabInterval=1;              % Setting frame capture interval
% vid_src=getselectedsource(vid);        % Setting up video source
% set(vid_src,'Tag','Autobot');          % Setting attribute to the source
% start(vid);

% SetText('Camera Configured',handles);

data = getsnapshot(vid);               % Getting snapshot 
imshow(data);                          % Displaying snapshot in window
imwrite(data,'Asmi.jpg');       
SetText('Snapshot taken',handles);

% stop(vid);