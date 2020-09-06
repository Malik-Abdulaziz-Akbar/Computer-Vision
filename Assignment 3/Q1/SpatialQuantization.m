function varargout = SpatialQuantization(varargin)
% SPATIALQUANTIZATION MATLAB code for SpatialQuantization.fig
%      SPATIALQUANTIZATION, by itself, creates a new SPATIALQUANTIZATION or raises the existing
%      singleton*.
%
%      H = SPATIALQUANTIZATION returns the handle to a new SPATIALQUANTIZATION or the handle to
%      the existing singleton*.
%
%      SPATIALQUANTIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPATIALQUANTIZATION.M with the given input arguments.
%
%      SPATIALQUANTIZATION('Property','Value',...) creates a new SPATIALQUANTIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpatialQuantization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpatialQuantization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpatialQuantization

% Last Modified by GUIDE v2.5 17-Nov-2019 15:53:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpatialQuantization_OpeningFcn, ...
                   'gui_OutputFcn',  @SpatialQuantization_OutputFcn, ...
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


% --- Executes just before SpatialQuantization is made visible.
function SpatialQuantization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpatialQuantization (see VARARGIN)

% Choose default command line output for SpatialQuantization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpatialQuantization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpatialQuantization_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    contents = cellstr(get(hObject,'String'))
    popupChoice =contents{get(hObject,'Value')}
    setappdata(0,'Method',popupChoice)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 k=str2double(get(hObject,'String'));
 setappdata(0,'Rows',k);
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
 k=str2double(get(hObject,'String'));
 setappdata(0,'Cols',k);
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my=getappdata(0,'path');
myImage=imread(my);
[r,c,band]=size(myImage);
Method=getappdata(0,'Method');
if(band>1 )
   myImage=rgb2gray(myImage); 
end
Rows=getappdata(0,'Rows');
Cols=getappdata(0,'Cols'); 
Filter=str2double(getappdata(0,'Filter'));


if (strcmp(Method,'Decimation'))
    if(Filter==1)
       myImage=MeanSmoothing(myImage);
    end
    myImage=Decimation(myImage, Rows, Cols);
    
end
if (strcmp(Method,'Median'))
    
     myImage=MedianFilter(myImage, Rows, Cols);
end
if (strcmp(Method,'Averaging'))
    myImage=MeanFilter(myImage, Rows, Cols);
   
end
    %myImage=uint8(myImage);
    figure, image(myImage);
    colormap(gray(256));


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==1)
    setappdata(0,'Filter','1');
end
if(get(hObject,'Value')~=1)
    setappdata(0,'Filter','0');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
