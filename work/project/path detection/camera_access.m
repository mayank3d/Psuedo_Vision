% Create video input object. 
vid = videoinput('winvideo') 
% Set video input object properties for this application. 
% Note that example uses both SET method and dot notation method. 
set(vid,'TriggerRepeat',Inf); 
vid.FrameGrabInterval = 5; 
% Set value of a video source object property. 
vid_src = getselectedsource(vid); 
set(vid_src,'Tag','motion detection setup'); 
% Create a figure window. 
figure; 
% Start acquiring frames. 
start(vid) 
% Calculate difference image and display it. 
while(vid.FramesAcquired<=100) % Stop after 100 frames 
data = getdata(vid,2); 
diff_im = imadd(data(:,:,:,1),-data(:,:,:,2)); 
imshow(diff_im); 
end 
stop(vid)