function varargout = A2Q1(varargin)
% A2Q1 MATLAB code for A2Q1.fig
%      A2Q1, by itself, creates a new A2Q1 or raises the existing
%      singleton*.
%
%      H = A2Q1 returns the handle to a new A2Q1 or the handle to
%      the existing singleton*.
%
%      A2Q1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A2Q1.M with the given input arguments.
%
%      A2Q1('Property','Value',...) creates a new A2Q1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A2Q1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A2Q1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A2Q1

% Last Modified by GUIDE v2.5 13-Oct-2019 10:53:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A2Q1_OpeningFcn, ...
                   'gui_OutputFcn',  @A2Q1_OutputFcn, ...
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


% --- Executes just before A2Q1 is made visible.
function A2Q1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A2Q1 (see VARARGIN)

% Choose default command line output for A2Q1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A2Q1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A2Q1_OutputFcn(hObject, eventdata, handles) 
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
img=getappdata(0,'imagepath');
a=imread(img);
img=getappdata(0,'imagepath2');
b=imread(img);
[r,c,bands]=size(a);
[r1,c1,bands1]=size(b);
if (bands==1 && bands1==1)    
    final_img=AND(a,b);
    figure, image(final_img)
    colormap(gray(256));
end   
if (bands==1 && bands1>1)
    or_r=AND(a,b(:,:,1));
    or_g=AND(a,b(:,:,2));
    or_b=AND(a,b(:,:,3));
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end
if (bands>1 && bands1==1)
    or_r=AND(a(:,:,1),b);
    or_g=AND(a(:,:,2),b);
    or_b=AND(a(:,:,3),b);
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end
if (bands>1 && bands1>1)
    or_r=AND(a(:,:,1),b(:,:,1));
    or_g=AND(a(:,:,2),b(:,:,2));
    or_b=AND(a(:,:,3),b(:,:,3));
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(0,'imagepath');
img1=imread(img);
if size(img1,3)==1
    final_img=NOT(img1);
    final_img=uint8(final_img);
    figure, image(final_img);
    colormap(gray(256));
end
if size(img1,3)>1
    r=NOT(img1(:,:,1));
    g=NOT(img1(:,:,2));
    b=NOT(img1(:,:,3));
    final_img=cat(3,r,g,b);
    final_img=uint8(final_img);
    figure, image(final_img);
    colormap(gray(256));
end
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(0,'imagepath2');
img1=imread(img);
if size(img1,3)==1
    final_img=NOT(img1);
    final_img=uint8(final_img);
    figure, image(final_img);
    colormap(gray(256));
end
if size(img1,3)>1
    r=NOT(img1(:,:,1));
    g=NOT(img1(:,:,2));
    b=NOT(img1(:,:,3));
    final_img=cat(3,r,g,b);
    final_img=uint8(final_img);
    figure, image(final_img);
    colormap(gray(256));
end
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(0,'imagepath');
a=imread(img);
img=getappdata(0,'imagepath2');
b=imread(img);
[r,c,bands]=size(a);
[r1,c1,bands1]=size(b);
if (bands==1 && bands1==1)    
    final_img=OR(a,b);
    figure, image(final_img)
    colormap(gray(256));
end   
if (bands==1 && bands1>1)
    or_r=OR(a,b(:,:,1));
    or_g=OR(a,b(:,:,2));
    or_b=OR(a,b(:,:,3));
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end
if (bands>1 && bands1==1)
    or_r=OR(a(:,:,1),b);
    or_g=OR(a(:,:,2),b);
    or_b=OR(a(:,:,3),b);
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end
if (bands>1 && bands1>1)
    or_r=OR(a(:,:,1),b(:,:,1));
    or_g=OR(a(:,:,2),b(:,:,2));
    or_b=OR(a(:,:,3),b(:,:,3));
    final_img=cat(3,or_r,or_g,or_b);
    final_img=uint8(final_img);
    figure, image(final_img)
end
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile( ...
{
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');
ima=strcat(pathname,filename);
setappdata(0,'imagepath',ima);
axes(handles.axes1);
imshow(ima)

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {   
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');
ima=strcat(pathname,filename);
setappdata(0,'imagepath2',ima);
axes(handles.axes2);
imshow(ima)
