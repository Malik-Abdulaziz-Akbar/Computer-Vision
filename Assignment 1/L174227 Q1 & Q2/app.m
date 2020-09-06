
function varargout = app(varargin)
% APP MATLAB code for app.fig
%      APP, by itself, creates a new APP or raises the existing
%      singleton*.
%
%      H = APP returns the handle to a new APP or the handle to
%      the existing singleton*.
%
%      APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP.M with the given input arguments.
%
%      APP('Property','Value',...) creates a new APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app

% Last Modified by GUIDE v2.5 08-Oct-2019 10:51:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_OpeningFcn, ...
                   'gui_OutputFcn',  @app_OutputFcn, ...
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


% --- Executes just before app is made visible.
function app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app (see VARARGIN)

% Choose default command line output for app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
img=getappdata(0,'imagepath');
imgi=imread(img);
[row,col,bands]=size(imgi);
if bands>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    zoomed_r_image=ZeroOrderHold(imgi_R);
    zoomed_g_image=ZeroOrderHold(imgi_G);
    zoomed_b_image=ZeroOrderHold(imgi_B);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if bands==1

    imgi_grey=Matrixx(imgi,r,c,h,w);
    zoomed_grey=ZeroOrderHold(imgi_grey);
    axes(handles.axes1);
    imgg=uint8(zoomed_grey);
    figure, image(imgg) 
end
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
img=getappdata(0,'imagepath');
imgi=imread(img);

if size(imgi,3)>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    zoomed_r_image=FirstOrderHold(imgi_R);
    zoomed_g_image=FirstOrderHold(imgi_G);
    zoomed_b_image=FirstOrderHold(imgi_B);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if size(imgi,3)==1
    imgi_grey=Matrixx(imgi,r,c,h,w);
    zoomed_grey=FirstOrderHold(imgi_grey);
    imgg=uint8(zoomed_grey);
    figure, image(imgg)
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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
a=str2double(get(handles.edit4,'String'));
if isnan(a)
   fprintf('Entry "%s" is not a valid number!\n', a);
   return
end
setappdata(0,'box5',a);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
a=str2double(get(handles.edit5,'String'));
if isnan(a)
   fprintf('Entry "%s" is not a valid number!\n', a);
   return
end
setappdata(0,'box3',a);

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
a=str2double(get(handles.edit7,'String'));
if isnan(a)
   fprintf('Entry "%s" is not a valid number!\n', a);
   return
end
setappdata(0,'box4',a);

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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
k=getappdata(0,'box5');
img=getappdata(0,'imagepath');
imgi=imread(img);
[row,col,bands]=size(imgi);
if bands>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    zoomed_r_image=Kzoom(imgi_R,k);
    zoomed_g_image=Kzoom(imgi_G,k);
    zoomed_b_image=Kzoom(imgi_B,k);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if bands==1
    imgi_grey=Matrixx(imgi,r,c,h,w);
    zoomed_grey=Kzoom(imgi_grey,k);
    imgg=uint8(zoomed_grey);
    figure, image(imgg)
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
img=getappdata(0,'imagepath');
imgi=imread(img);

if size(imgi,3)>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    padded=Zero(imgi_R);
    zoomed_r_image=FirstOrderHold(padded);
    padded=Zero(imgi_G);
    zoomed_g_image=FirstOrderHold(padded);
    padded=Zero(imgi_B);
    zoomed_b_image=FirstOrderHold(padded);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if size(imgi,3)==1
    imgi_grey=Matrixx(imgi,r,c,h,w);
    zoomed_grey=FirstOrderHold(imgi_grey);
    imgg=uint8(zoomed_grey);
    figure, image(imgg)
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
img=getappdata(0,'imagepath');
imgi=imread(img);

if size(imgi,3)>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    padded=Zero(imgi_R);
    padded=Zero_padding(padded);
    zoomed_r_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_r_image);
    zoomed_r_image=zoomed_r_image(2:x-1,2:y-1);
    padded=Zero(imgi_G);
    padded=Zero_padding(padded);
    zoomed_g_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_g_image);
    zoomed_g_image=zoomed_g_image(2:x-1,2:y-1);
    padded=Zero(imgi_B);
    padded=Zero_padding(padded);
    zoomed_b_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_b_image);
    zoomed_b_image=zoomed_b_image(2:x-1,2:y-1);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if size(imgi,3)==1
    imgi_grey=Matrixx(imgi,r,c,h,w);
    padded=Zero(imgi_grey);
    padded=Zero_padding(padded);
    zoomed_grey=FirstOrderHold(padded);
    [x,y]=size(zoomed_grey);
    zoomed_grey=zoomed_grey(2:x-1,2:y-1);
    imgg=uint8(zoomed_grey);
    figure, image(imgg)
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=getappdata(0,'box1');
c=getappdata(0,'box2');
h=getappdata(0,'box3');
w=getappdata(0,'box4');
img=getappdata(0,'imagepath');
imgi=imread(img);

if size(imgi,3)>1
    imgi_R=Matrixx(imgi(:,:,1),r,c,h,w);
    imgi_G=Matrixx(imgi(:,:,2),r,c,h,w);
    imgi_B=Matrixx(imgi(:,:,3),r,c,h,w);
    padded=Zero(imgi_R);
    padded=Zero_padding(padded);
    padded=Zero_padding(padded);
    zoomed_r_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_r_image);
    zoomed_r_image=zoomed_r_image(2:x-1,2:y-1);
    [x,y]=size(zoomed_r_image);
    zoomed_r_image=zoomed_r_image(2:x-1,2:y-1);
    padded=Zero(imgi_G);
    padded=Zero_padding(padded);
    padded=Zero_padding(padded);
    zoomed_g_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_g_image);
    zoomed_g_image=zoomed_g_image(2:x-1,2:y-1);
    [x,y]=size(zoomed_g_image);
    zoomed_g_image=zoomed_g_image(2:x-1,2:y-1);
    padded=Zero(imgi_B);
    padded=Zero_padding(padded);
    padded=Zero_padding(padded);
    zoomed_b_image=FirstOrderHold(padded);
    [x,y]=size(zoomed_b_image);
    zoomed_b_image=zoomed_b_image(2:x-1,2:y-1);
    [x,y]=size(zoomed_b_image);
    zoomed_b_image=zoomed_b_image(2:x-1,2:y-1);
    new_RGB=cat(3,zoomed_r_image,zoomed_g_image,zoomed_b_image);
    axes(handles.axes1);
    imgg=uint8(new_RGB);
    figure, image(imgg)
end
if size(imgi,3)==1
    imgi_grey=Matrixx(imgi,r,c,h,w);
    padded=Zero(imgi_grey);
    padded=Zero_padding(padded);
    padded=Zero_padding(padded);
    zoomed_grey=FirstOrderHold(padded);
    [x,y]=size(zoomed_grey);
    zoomed_grey=zoomed_grey(2:x-1,2:y-1);
    [x,y]=size(zoomed_grey);
    zoomed_grey=zoomed_grey(2:x-1,2:y-1);
    imgg=uint8(zoomed_grey);
    figure, image(imgg)
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
