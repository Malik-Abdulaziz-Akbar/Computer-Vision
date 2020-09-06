function varargout = OTSU(varargin)
% OTSU MATLAB code for OTSU.fig
%      OTSU, by itself, creates a new OTSU or raises the existing
%      singleton*.
%
%      H = OTSU returns the handle to a new OTSU or the handle to
%      the existing singleton*.
%
%      OTSU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OTSU.M with the given input arguments.
%
%      OTSU('Property','Value',...) creates a new OTSU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OTSU_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OTSU_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OTSU

% Last Modified by GUIDE v2.5 17-Nov-2019 20:20:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OTSU_OpeningFcn, ...
                   'gui_OutputFcn',  @OTSU_OutputFcn, ...
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


% --- Executes just before OTSU is made visible.
function OTSU_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OTSU (see VARARGIN)

% Choose default command line output for OTSU
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OTSU wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OTSU_OutputFcn(hObject, eventdata, handles) 
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
             setappdata(0,'path',myImage);
             axes(handles.axes1);
             imshow(myImage)
             
             
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my=getappdata(0,'path');
myImage=imread(my);
[myImage,tres]=OTSUFunction(myImage);
imshow(myImage);
textLabel = sprintf('= %f', tres);
set(handles.text4, 'String', textLabel);
