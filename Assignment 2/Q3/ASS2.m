function varargout = ASS2(varargin)
% ASS2 MATLAB code for ASS2.fig
%      ASS2, by itself, creates a new ASS2 or raises the existing
%      singleton*.
%
%      H = ASS2 returns the handle to a new ASS2 or the handle to
%      the existing singleton*.
%
%      ASS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASS2.M with the given input arguments.
%
%      ASS2('Property','Value',...) creates a new ASS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ASS2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ASS2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ASS2

% Last Modified by GUIDE v2.5 16-Oct-2019 21:50:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ASS2_OpeningFcn, ...
                   'gui_OutputFcn',  @ASS2_OutputFcn, ...
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


% --- Executes just before ASS2 is made visible.
function ASS2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ASS2 (see VARARGIN)

% Choose default command line output for ASS2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ASS2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ASS2_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.tif'},'File Selector');
myImage = strcat(pathname, filename);
setappdata(0,'path1',myImage);
axes(handles.axes1);
imshow(myImage);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.tif'},'File Selector');
myImage = strcat(pathname, filename);
setappdata(0,'path2',myImage);
axes(handles.axes2);
imshow(myImage);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my=getappdata(0,'path1');
myImage1=imread(my);
[r,c,band1]=size(myImage1);
my=getappdata(0,'path2');
myImage2=imread(my);
[r,c,band2]=size(myImage2);
if(band1>1 && band2>1)
    R=Subtract(myImage1(:,:,1),myImage2(:,:,1));
    G=Subtract(myImage1(:,:,2),myImage2(:,:,2));
    B=Subtract(myImage1(:,:,3),myImage2(:,:,3));
    myImage=cat(3,R,G,B);
    myImage=uint8(myImage);
    figure, image(myImage);
end
if(band1==1 && band2==1)
    myImage=Subtract(myImage1,myImage2);
    myImage=uint8(myImage);
    figure, image(myImage);
    colormap(gray(256));
end
if(band1>1 && band2==1)
    R=Subtract(myImage1(:,:,1),myImage2);
    G=Subtract(myImage1(:,:,2),myImage2);
    B=Subtract(myImage1(:,:,3),myImage2);
    myImage=cat(3,R,G,B);
    myImage=uint8(myImage);
    figure, image(myImage);
end
if(band1==1 && band2>1)
    R=Subtract(myImage1,myImage2(:,:,1));
    G=Subtract(myImage1,myImage2(:,:,2));
    B=Subtract(myImage1,myImage2(:,:,3));
    myImage=cat(3,R,G,B);
    myImage=uint8(myImage);
    figure, image(myImage);
end
