function k=DetectEdge(y,handles)

k=edge(y);                             % Sobel edge detection by default
disp('Edge Detected');
SetText('Edge Detected',handles);
