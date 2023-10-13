function varargout = shapes(varargin)
% SHAPES MATLAB code for shapes.fig
%      SHAPES, by itself, creates a new SHAPES or raises the existing
%      singleton*.
%
%      H = SHAPES returns the handle to a new SHAPES or the handle to
%      the existing singleton*.
%
%      SHAPES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHAPES.M with the given input arguments.
%
%      SHAPES('Property','Value',...) creates a new SHAPES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shapes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shapes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shapes

% Last Modified by GUIDE v2.5 26-Apr-2019 14:48:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shapes_OpeningFcn, ...
                   'gui_OutputFcn',  @shapes_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before shapes is made visible.
function shapes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shapes (see VARARGIN)

% Choose default command line output for shapes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shapes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shapes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit2 and none of its controls.
function edit2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in square.
function square_Callback(hObject, eventdata, handles)
% hObject    handle to square (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in tringle.
global dir;
global color;
setappdata(0,'come','shape');
i = getappdata(0,'re');
xx = getappdata(0,'x');
yy = getappdata(0,'y');
ch = get(handles.checkbox1,'Value');
x2=0;
y2=0;
val = str2num(get(handles.edit5, 'String'));
    x2 = xx +val;
    y2 = yy;
    x3 = x2;
    y3 = y2+(val);
    x4 = xx;
    y4 = y3;
    x5 = xx;
    y5 = yy;

if ch 
    if strcmp(color ,'Blue')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','red');
    else
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','green');
    end
else 
     if strcmp(color ,'Blue')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','red');
    else
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','green');
    end
end
setappdata(0,'I1',i);
MainUI;
close(shapes);
function tringle_Callback(hObject, eventdata, handles)
% hObject    handle to tringle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dir;
global color;
setappdata(0,'come','shape');
i = getappdata(0,'re');
xx = getappdata(0,'x');
yy = getappdata(0,'y');
ch = get(handles.checkbox1,'Value');
x2=0;
y2=0;
val = str2num(get(handles.edit5, 'String'));
    x2 = xx +val/2;
    y2 = yy+val;
    x3 = x2-val;
    y3 = y2;
    x4 = xx;
    y4 = yy;
if ch 
    if strcmp(color ,'Blue')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4],'Color','red');
    else
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4],'Color','green');
    end
else 
     if strcmp(color ,'Blue')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 ],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 ],'Color','red');
    else
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 ],'Color','green');
    end
end
setappdata(0,'I1',i);
MainUI;
close(shapes);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global color;
setappdata(0,'come','shape');
i = getappdata(0,'re');
xx = getappdata(0,'x');
yy = getappdata(0,'y');
ch = get(handles.checkbox1,'Value');
if(ch==1)
    if strcmp(color ,'Blue')
i = insertShape(i,'FilledCircle',[xx yy str2num(get(handles.edit5, 'String'))],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'FilledCircle',[xx yy str2num(get(handles.edit5, 'String'))],'Color','red');
    else
i = insertShape(i,'FilledCircle',[xx yy str2num(get(handles.edit5, 'String'))],'Color','green');    
    end
end
setappdata(0,'I1',i);
MainUI;
close(shapes);

% --- Executes on button press in line.
function line_Callback(hObject, eventdata, handles)
% hObject    handle to line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dir;
global color;
setappdata(0,'come','shape');
i = getappdata(0,'re');
xx = getappdata(0,'x');
yy = getappdata(0,'y');
ch = get(handles.checkbox1,'Value');
x2=0;
y2=0;
if strcmp(dir,'Horizontal')
    x2 =xx+ str2num(get(handles.edit5, 'String'));
    y2 = yy;
else
    x2 =xx;
    y2 = yy+ str2num(get(handles.edit5, 'String'));
end
    if strcmp(color ,'Blue')
i = insertShape(i,'Line',[xx yy x2 y2],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'Line',[xx yy x2 y2],'Color','red');
    else
i = insertShape(i,'Line',[xx yy x2 y2],'Color','green');    
    end
setappdata(0,'I1',i);
MainUI;
close(shapes);

% --- Executes on button press in rectangle.
function rectangle_Callback(hObject, eventdata, handles)
% hObject    handle to rectangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dir;
global color;
setappdata(0,'come','shape');
i = getappdata(0,'re');
xx = getappdata(0,'x');
yy = getappdata(0,'y');
ch = get(handles.checkbox1,'Value');
x2=0;
y2=0;
val = str2num(get(handles.edit5, 'String'));
if strcmp(dir,'Horizontal')
    x2 = xx +val;
    y2 = yy;
    x3 = x2;
    y3 = y2+(val/2);
    x4 = xx;
    y4 = y3;
    x5 = xx;
    y5 = yy;
else
    x2 = xx +val/2;
    y2 = yy;
    x3 = x2;
    y3 = y2+(val);
    x4 = x3-val/2;
    y4 = y3;
    x5 = xx;
    y5 = yy;
end
if ch 
    if strcmp(color ,'Blue')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','red');
    else
i = insertShape(i,'FilledPolygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','green');
    end
else 
     if strcmp(color ,'Blue')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','blue');
    elseif strcmp(color,'Red')
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','red');
    else
i = insertShape(i,'Polygon',[xx yy x2 y2 x3 y3 x4 y4 x5 y5],'Color','green');
    end
end
setappdata(0,'I1',i);
MainUI;
close(shapes);



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global color;
color = get(get(handles.uipanel3,'SelectedObject'), 'String')


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global dir;
dir = get(get(handles.uipanel5,'SelectedObject'), 'String')
