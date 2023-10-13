function varargout = MainUI(varargin)
global filt;
% MAINUI MATLAB code for MainUI.fig
%      MAINUI, by itself, creates a new MAINUI or raises the existing
%      singleton*.
%
%      H = MAINUI returns the handle to a new MAINUI or the handle to
%      the existing singleton*.
%
%      MAINUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINUI.M with the given input arguments.
%
%      MAINUI('Property','Value',...) creates a new MAINUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainUI_OpeningFcn gets calledgra.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainUI

% Last Modified by GUIDE v2.5 02-May-2019 10:22:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainUI_OutputFcn, ...
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


% --- Executes just before MainUI is made visible.
function MainUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainUI (see VARARGIN)

% Choose default command line output for MainUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
global rotateValue;
rotateValue = 0;
% --- Outputs from this function are returned to the command line.
function varargout = MainUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

function mouseMove (object, eventdata)
C = get (gca, 'CurrentPoint');
xlabel(gca, ['(X,Y) = (', num2str(round(C(1,1))), ', ',num2str(round(C(1,2))), ')']);
cs = getappdata(0,'come');
if strcmp(cs,'pen')
    global redoImage;
    hand = imshow(redoImage);
    set(hand,'ButtonDownFcn',@ImageClickCallback);
end

% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,filePath] = uigetfile('*', 'Select data file', '.');
if filePath==0, error('None selected!'); close(MainUI);end
global hand;
global filt;
global image;
global undoImage;
global redoImage;
redoImage = imread( fullfile(filePath,fileName) );
redoImage = imresize(redoImage,[320 480]);
image = redoImage;
filt = redoImage;
axes(handles.axes1);
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
temI = redoImage;
[filename, foldername] = uiputfile('Where do you want the file saved?');
complete_name = fullfile(foldername, filename);
imwrite(temI, complete_name);

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(MainUI);
% --------------------------------------------------------------------
function filters_Callback(hObject, eventdata, handles)
% hObject    handle to filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global redoImage;
image = redoImage;

% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function operations_Callback(hObject, eventdata, handles)
% hObject    handle to operations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rotate_cw_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_cw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rotateValue;
global redoImage;
global undoImage;
global image;
undoImage = redoImage;
axes(handles.axes1);
rotateValue = -90
tem = imrotate(redoImage,rotateValue,'bilinear');
redoImage= tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);

% --------------------------------------------------------------------
function rotate_ccw_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_ccw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rotateValue;
global redoImage;
global undoImage;
global image;
undoImage = redoImage;
axes(handles.axes1);
rotateValue = 90
tem = imrotate(redoImage,rotateValue,'bilinear');
redoImage= tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);

% --------------------------------------------------------------------
function redo_Callback(hObject, eventdata, handles)
% hObject    handle to redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);

% --------------------------------------------------------------------
function undo_Callback(hObject, eventdata, handles)
% hObject    handle to undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global undoImage;
global redoImage;
hand = imshow(undoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);


% --------------------------------------------------------------------
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure
global redoImage;
imageHistoFun(redoImage);

% --------------------------------------------------------------------
function gray_Callback(hObject, eventdata, handles)
% hObject    handle to gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
if size(redoImage,3)==3
undoImage = redoImage;
axes(handles.axes1);
tem = grayImageFun(redoImage);
redoImage= tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
else
    
end

% --------------------------------------------------------------------
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
undoImage = redoImage;
axes(handles.axes1);
tem = guassNoiseFun(redoImage);
redoImage= tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
global filt;
flit = 1;
% --------------------------------------------------------------------
function smoth_Callback(hObject, eventdata, handles)
% hObject    handle to smoth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
undoImage = redoImage;
axes(handles.axes1);
tem = smoothFun(redoImage);
redoImage = tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
global filt;
flit = 2;
% --------------------------------------------------------------------
function edge_Callback(hObject, eventdata, handles)
% hObject    handle to edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
undoImage = redoImage;
axes(handles.axes1);
tem = edgeDetectFun(redoImage);
redoImage = tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
global filt;
flit = 3;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.slider1,'Value');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global redoImage;
global image;
global undoImage;
undoImage = redoImage;
axes(handles.axes1);
tem = smoothFun(image,sliderValue);
redoImage = tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);
global filt;
flit = 2;

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function flipHorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to flipHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
global image;
undoImage = redoImage;
axes(handles.axes1);
tem =flipdim(redoImage ,2);           %# horizontal flip 
redoImage = tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);

% --------------------------------------------------------------------
function flipVertical_Callback(hObject, eventdata, handles)
% hObject    handle to flipVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global undoImage;
global image;
undoImage = redoImage;
axes(handles.axes1);
tem =flipdim(redoImage ,1);           %# horizontal flip 
redoImage = tem;
hand = imshow(redoImage);
set(hand,'ButtonDownFcn',@ImageClickCallback);


% --- Executes on button press in pen.
function pen_Callback(hObject, eventdata, handles)
% hObject    handle to pen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PenGUI;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in shapeBtn.
function shapeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to shapeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'d',0);
global redoImage;
global image;
global undoImage;
global C;
setappdata(0,'re',redoImage);
setappdata(0,'un',undoImage);
shapes;
close(MainUI);

% --- Executes on button press in frame.
function frame_Callback(hObject, eventdata, handles)
% hObject    handle to frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
setappdata(0,'re',redoImage);
FrameGUI;
close(MainUI);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
global image;
global undoImage;
global C;
setappdata(0,'re',redoImage);
setappdata(0,'un',undoImage);
textGUI;
close(MainUI);
% --------------------------------------------------------------------
function rgb_chanals_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_chanals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Read in original RGB image.
global redoImage;
if size(redoImage,3)==3
figure;
rgbImage = redoImage;
% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel
% Create an all black channel.
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');
% Create color versions of the individual color channels.
just_red = cat(3, redChannel, allBlack, allBlack);
just_green = cat(3, allBlack, greenChannel, allBlack);
just_blue = cat(3, allBlack, allBlack, blueChannel);
% Recombine the individual color channels to create the original RGB image again.
recombinedRGBImage = cat(3, redChannel, greenChannel, blueChannel);
% Display them all.
subplot(2, 2, 1);
imshow(rgbImage);
fontSize = 20;
title('Original RGB Image')
subplot(2, 2, 2);
imshow(just_red);
title('Red Channel in Red')
subplot(2, 2, 3);
imshow(just_green)
title('Green Channel in Green')
subplot(2, 2, 4);
imshow(just_blue);
title('Blue Channel in Blue')

% Set up figure properties:
% Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% % Get rid of tool bar and pulldown menus that are along top of figure.
% % set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% % Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')
end
% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
va = getappdata(0,'come')
global hand;
global undoImage;
global redoImage;
if strcmp(va,'shape')
    ima = getappdata(0,'I1');
    undoImage = redoImage;
    redoImage = ima;
    axes(handles.axes1);
    hand = imshow(ima);
    set(hand,'ButtonDownFcn',@ImageClickCallback);
elseif strcmp(va,'text')
    text = getappdata(0,'text');
    textColor = getappdata(0,'textColor');
    boxColor = getappdata(0,'boxColor');
    boxOpacity = getappdata(0,'boxOpacity');
    redoImage = insertText(redoImage,[getappdata(0,'x') getappdata(0,'y')],text,'FontSize',18,'BoxColor',...
    boxColor,'BoxOpacity',boxOpacity,'TextColor',textColor);
    axes(handles.axes1);
    hand = imshow(redoImage);
    set(hand,'ButtonDownFcn',@ImageClickCallback);
else
    redoImage = getappdata(0,'I1');
    hand = imshow(redoImage);
    set(hand,'ButtonDownFcn',@ImageClickCallback);
end
setappdata(0,'d',0);
function ImageClickCallback ( objectHandle , eventData )
    axesHandle  = get(objectHandle,'Parent');
    coordinates = get(axesHandle,'CurrentPoint'); 
    coordinates = coordinates(1,1:2);
    setappdata(0,'x',coordinates(1));
    setappdata(0,'y',coordinates(2));
    com = getappdata(0,'come');
    cu = getappdata(0,'come');
    global redoImage;
    global undoImage;
    if strcmp(cu,'pen')
        undoImage = redoImage;
       redoImage = insertShape(redoImage,'FilledCircle',[coordinates(1) coordinates(2) str2num(getappdata(0,'penRad'))],'Color',getappdata(0,'penColor'));
    else
    message     = sprintf('x: %.1f , y: %.1f',coordinates (1) ,coordinates (2));
    helpdlg(message);
    end
    

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'come',' ');


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)f
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global redoImage;
redoImage = 0;
setappdata(0,'come',' ');
% Hint: delete(hObject) closes the figure
delete(hObject);


% --------------------------------------------------------------------


% --- Executes on button press in explore.
function explore_Callback(hObject, eventdata, handles)
% hObject    handle to explore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
setappdata(0,'re',image);
explore();
