function varargout = labeling(varargin)
% LABELING MATLAB code for labeling.fig
%      LABELING, by itself, creates a new LABELING or raises the existing
%      singleton*.
%
%      H = LABELING returns the handle to a new LABELING or the handle to
%      the existing singleton*.
%
%      LABELING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABELING.M with the given input arguments.
%
%      LABELING('Property','Value',...) creates a new LABELING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before labeling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to labeling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help labeling

% Last Modified by GUIDE v2.5 17-Nov-2019 17:33:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @labeling_OpeningFcn, ...
                   'gui_OutputFcn',  @labeling_OutputFcn, ...
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


% --- Executes just before labeling is made visible.
function labeling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to labeling (see VARARGIN)

% Choose default command line output for labeling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes labeling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = labeling_OutputFcn(hObject, eventdata, handles) 
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
myImage=FindLabels(myImage);
unique_labels = unique(myImage);
unique_labels = unique_labels';
[r,c] = size(unique_labels);
imshow(myImage);
for i=1:c-1
    I = SeparateLabel(myImage, unique_labels(1,i+1));
    figure, image(I);
    colormap(gray(256));
    title(['Label',num2str(i)]);
end
%
%myImage=uint8(myImage);
%figure, image(myImage);
%colormap(gray(256));
