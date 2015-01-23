function [data1,str]=ConfigureParallelPort(handles)

DIO = digitalio('parallel','LPT1');
data1 = addline(DIO,0:7,0,'out'); %Pin 2-9
data2 = addline(DIO,0,2,'out'); %Pin 1
data3 = addline(DIO,1,2,'out') ;%Pin 14

SetText('Parallel Port Configured',handles);
