function varargout = Quantization(varargin)
% QUANTIZATION MATLAB code for Quantization.fig
%      QUANTIZATION, by itself, creates a new QUANTIZATION or raises the existing
%      singleton*.
%
%      H = QUANTIZATION returns the handle to a new QUANTIZATION or the handle to
%      the existing singleton*.
%
%      QUANTIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUANTIZATION.M with the given input arguments.
%
%      QUANTIZATION('Property','Value',...) creates a new QUANTIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Quantization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Quantization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Quantization

% Last Modified by GUIDE v2.5 19-Oct-2019 17:36:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Quantization_OpeningFcn, ...
                   'gui_OutputFcn',  @Quantization_OutputFcn, ...
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


% --- Executes just before Quantization is made visible.
function Quantization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Quantization (see VARARGIN)

% Choose default command line output for Quantization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Quantization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Quantization_OutputFcn(hObject, eventdata, handles) 
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
my=getappdata(0,'path1');
myImage=imread(my);
[r,c,band]=size(myImage);
graylevels=getappdata(0,'pop');
if(band>1 )
    R=IGSQuantization(myImage(:,:,1),graylevels,3);
    G=IGSQuantization(myImage(:,:,2),graylevels,3);
    B=IGSQuantization(myImage(:,:,3),graylevels,3);
    myImage=cat(3,R,G,B);
    myImage=uint8(myImage);
    figure, image(myImage);
end
if(band==1)
    myImage=IGSQuantization(myImage,graylevels,3);
    myImage=uint8(myImage);
    figure, image(myImage);
    colormap(gray(256));
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my=getappdata(0,'path1');
myImage=imread(my);
[r,c,band]=size(myImage);
graylevels=getappdata(0,'pop');
if(band>1 )
    R=UniformQuantization(myImage(:,:,1),graylevels,3);
    G=UniformQuantization(myImage(:,:,2),graylevels,3);
    B=UniformQuantization(myImage(:,:,3),graylevels,3);
    myImage=cat(3,R,G,B);
    myImage=uint8(myImage);
    figure, image(myImage);
end
if(band==1)
    myImage=UniformQuantization(myImage,graylevels,3);
    myImage=uint8(myImage);
    figure, image(myImage);
    colormap(gray(256));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
    contents = cellstr(get(hObject,'String'))
    popupChoice =contents{get(hObject,'Value')}
    setappdata(0,'pop',str2double(popupChoice))
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
