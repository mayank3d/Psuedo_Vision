function vid=ConfigureVid(handles)

vid=videoinput('winvideo');            % Setting up video device
set(vid,'TriggerRepeat',inf);          % Configuring adapter
vid.FrameGrabInterval=10;              % Setting frame capture interval
vid_src=getselectedsource(vid);        % Setting up video source
set(vid_src,'Tag','Autobot');          % Setting attribute to the source

SetText('Camera Configured',handles);