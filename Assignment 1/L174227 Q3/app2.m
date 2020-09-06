function varargout = app2(varargin)
% APP2 MATLAB code for app2.fig
%      APP2, by itself, creates a new APP2 or raises the existing
%      singleton*.
%
%      H = APP2 returns the handle to a new APP2 or the handle to
%      the existing singleton*.
%
%      APP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP2.M with the given input arguments.
%
%      APP2('Property','Value',...) creates a new APP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app2

% Last Modified by GUIDE v2.5 08-Oct-2019 11:24:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app2_OpeningFcn, ...
                   'gui_OutputFcn',  @app2_OutputFcn, ...
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


% --- Executes just before app2 is made visible.
function app2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app2 (see VARARGIN)

% Choose default command line output for app2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app2_OutputFcn(hObject, eventdata, handles) 
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
[filename ,pathname]= uigetfile({'*.jpg','*.bmp'},'File Selector');
ima=strcat(pathname,filename);
setappdata(0,'imagepath',ima);
axes(handles.axes1);
imshow(ima)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=getappdata(0,'box2');
dir=getappdata(0,'pop');
rt=0;ct=0;
if (strcmp(dir,'Left'))
    ct=number*-1;
elseif (strcmp(dir,'Right'))
    ct=number;
elseif (strcmp(dir,'Up'))
    rt=number*-1;
    
elseif (strcmp(dir,'Down'))
    rt=number;
end
img=getappdata(0,'imagepath');
imgi=imread(img);
if size(imgi,3)>1
    imgi_R=Translate(imgi(:,:,1),rt,ct);
    imgi_G=Translate(imgi(:,:,2),rt,ct);
    imgi_B=Translate(imgi(:,:,3),rt,ct);
    new_RGB=cat(3,imgi_R,imgi_G,imgi_B);
    imgg=uint8(new_RGB);
    figure, image(imgg)
elseif size(imgi,3)==1
    new=Translate(imgi,rt,ct);
    imgg=uint8(new);
    figure, image(imgg)
end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
degree=getappdata(0,'box1');
img=getappdata(0,'imagepath');
imgi=imread(img);
if size(imgi,3)>1
    rot_r=Rotate(imgi(:,:,1),degree);
    rot_g=Rotate(imgi(:,:,2),degree);
    rot_b=Rotate(imgi(:,:,3),degree);
    new_RGB=cat(3,rot_r,rot_g,rot_b);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if size(imgi,3)==1
    rot=Rotate(imgi,degree);
    imgg=uint8(rot);
    figure, image(imgg)
end
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
contents=cellstr(get(hObject,'String'));
popChoice=contents(get(hObject,'Value'));
setappdata(0,'pop',popChoice);

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

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
a=str2double(get(handles.edit1,'String'));
if isnan(a)
   fprintf('Entry "%s" is not a valid number!\n', a);
   return
end
setappdata(0,'box1',a);
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
a=str2double(get(handles.edit2,'String'));
if isnan(a)
   fprintf('Entry "%s" is not a valid number!\n', a);
   return
end
setappdata(0,'box2',a);

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
degree=getappdata(0,'box1');
number=getappdata(0,'box2');
dir=getappdata(0,'pop');
rt=0;ct=0;
if (strcmp(dir,'Left'))
    ct=number*-1;
elseif (strcmp(dir,'Right'))
    ct=number;
elseif (strcmp(dir,'Up'))
    rt=number*-1;
    
elseif (strcmp(dir,'Down'))
    rt=number;
end
img=getappdata(0,'imagepath');
imgi=imread(img);
if size(imgi,3)>1
    imgi_R=Translate(imgi(:,:,1),rt,ct);
    rot_r=Rotate(imgi_R,degree);
    imgi_G=Translate(imgi(:,:,2),rt,ct);
    rot_g=Rotate(imgi_G,degree);
    imgi_B=Translate(imgi(:,:,3),rt,ct);
    rot_b=Rotate(imgi_B,degree);
    new_RGB=cat(3,rot_r,rot_g,rot_b);
    imgg=uint8(new_RGB);
    figure, image(imgg)
elseif size(imgi,3)==1
    new=Translate(imgi,rt,ct);
    rot_r=Rotate(new,degree);
    imgg=uint8(rot_r);
    figure, image(imgg)
end