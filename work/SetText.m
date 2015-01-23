function SetText(str,handles)

ResultsStr = get(handles.ResultList,'String');
ResultsStr=strvcat(ResultsStr,str);
set(handles.ResultList,'String',ResultsStr);

