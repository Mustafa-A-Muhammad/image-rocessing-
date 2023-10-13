function varargout = FrameGUI(varargin)
% FRAMEGUI MATLAB code for FrameGUI.fig
%      FRAMEGUI, by itself, creates a new FRAMEGUI or raises the existing
%      singleton*.
%
%      H = FRAMEGUI returns the handle to a new FRAMEGUI or the handle to
%      the existing singleton*.
%
%      FRAMEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRAMEGUI.M with the given input arguments.
%
%      FRAMEGUI('Property','Value',...) creates a new FRAMEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FrameGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FrameGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FrameGUI

% Last Modified by GUIDE v2.5 01-May-2019 18:43:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FrameGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FrameGUI_OutputFcn, ...
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


% --- Executes just before FrameGUI is made visible.
function FrameGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FrameGUI (see VARARGIN)

% Choose default command line output for FrameGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FrameGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FrameGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1;
global im2;
global im3;
global im4;
axes(handles.axes1);
im1 = imread('G:\4th stage\Savanah\PreImageProcessing\ImageProcessing\frames\frame2.png');
imshow(im1);
axes(handles.axes2);
im2 = imread('G:\4th stage\Savanah\PreImageProcessing\ImageProcessing\frames\frame3.jpg');
imshow(im2);
axes(handles.axes3);
im3 = imread('G:\4th stage\Savanah\PreImageProcessing\ImageProcessing\frames\frame4.jpg');
imshow(im3);
% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in one.
function one_Callback(hObject, eventdata, handles)
% hObject    handle to one (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1;
setappdata(0,'come','frame');
 newImage = combine(im1);
setappdata(0,'I1',newImage);
close(FrameGUI);
MainUI;
% --- Executes on button press in two.
function two_Callback(hObject, eventdata, handles)
% hObject    handle to two (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2;
setappdata(0,'come','frame');
 newImage = combine(im2);
setappdata(0,'I1',newImage);
close(FrameGUI);
MainUI;
% --- Executes on button press in three.
function three_Callback(hObject, eventdata, handles)
% hObject    handle to three (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im3;
setappdata(0,'come','frame');
 newImage = combine(im3);
setappdata(0,'I1',newImage);
close(FrameGUI);
MainUI;
% --- Executes on button press in four.
function four_Callback(hObject, eventdata, handles)
% hObject    handle to four (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im4;
 setappdata(0,'come','frame');
 newImage = combine(im4);
 setappdata(0,'I1',newImage);
 close(FrameGUI);
MainUI;
function output = combine(input)
frame=input;
im=getappdata(0,'re');
%select all white pixels in the frame
mask=all(frame>250,3);
%optional: select only the middle biggest blob
tmp=bwlabel(mask);
mask=tmp==tmp(round(end/2),round(end/2));
if true
    %now we need to make the image the same size as the mask
    im=imresize(im,size(mask));
else
    %we could also resize it in a different way and pad it with zeros
    mask_corners=[find(any(mask,2),1,'first') find(any(mask,2),1,'last') ...
        find(any(mask,1),1,'first') find(any(mask,1),1,'last')];
    im_inner=imresize(im,1+mask_corners([2 4])-mask_corners([1 3]));
    im_pad=zeros([size(mask) 3],'like',frame);
    im=im_pad;
    im(mask_corners(1):mask_corners(2),...
        mask_corners(3):mask_corners(4),:)=im_inner;
    %or any other way that results in im being the same size as mask
end
%extend the mask to RGB
mask=repmat(mask,1,3);
%merge the images
out_im=frame;
out_im(mask)=im(mask);
output = out_im;
