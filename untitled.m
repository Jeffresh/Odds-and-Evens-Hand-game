function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 14-Jun-2018 01:15:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
inicio(hObject, eventdata, handles)

function inicio(hObject, eventdata, handles)
global pl;
global jhv;
global jpc;
global nums;
global vs;
global ganadores_user;
ganadores_user=0;
global ganadores_pc;
ganadores_pc=0;
set(handles.text4, 'String', 'Empieza la partida...');

io = 1;


for i =1:5
    nums{i} = imread( sprintf('numero%d.png', i));
end

vs = imread('Vs.png');


% jugador humano 1, jugador pc 2
set(handles.text5, 'String', 'Dí tú o yo, ¿quíen empieza?');
axes(handles.axes10);
imshow(nums{3});
pause(1);
imshow(nums{2});
pause(1);
imshow(nums{1});
pause(1);
imshow(imread('ya.png'));
pl=whostart();
imshow(imread('Imagen_fondo.png'));


if pl == 1
 set(handles.text5, 'String', 'Vale, empiezo yo');
pause(2);
else
  set(handles.text5, 'String', 'Vale, empiezas tú');
    pause(2);
end
while io ~=0
    

    
    if pl == 2
        
            set(handles.text5, 'String', '¿Pares o nones?');
            axes(handles.axes10);
            imshow(nums{3});
            pause(1);
            imshow(nums{2});
            pause(1);
            imshow(nums{1});
            pause(1);
            imshow(imread('ya.png'));
            jhv = capturar_voz(3);
            imshow(imread('Imagen_fondo.png'));
        
        if jhv == 1
            set(handles.text8, 'String', 'Pares');
            set(handles.text10, 'String', 'Nones');
            set(handles.text9, 'String', num2str(ganadores_user));
            set(handles.text11, 'String', num2str(ganadores_pc));
            set(handles.text5, 'String', '');
                pause(2);

        else
            set(handles.text10, 'String', 'Pares');
            set(handles.text8, 'String', 'Nones');
            set(handles.text9, 'String', num2str(ganadores_user));
            set(handles.text11, 'String', num2str(ganadores_pc));
            set(handles.text5, 'String', '');
                pause(2);

        end
        
        pause(3);
        
        cam(hObject, eventdata, handles);         
        jpc = randi(5,1);
        whoswin(hObject, eventdata, handles);
       
        
    else
        
        
        jhv = randi(2,1);
        
        if jhv == 1
            set(handles.text8, 'String', 'Pares');
            set(handles.text10, 'String', 'Nones');
            set(handles.text9, 'String', num2str(ganadores_user));
            set(handles.text11, 'String', num2str(ganadores_pc));
            set(handles.text5, 'String', '');
            pause(2);
            
        else
            
            set(handles.text10, 'String', 'Pares');
            set(handles.text8, 'String', 'Nones');
            set(handles.text9, 'String', num2str(ganadores_user));
            set(handles.text11, 'String', num2str(ganadores_pc));
            set(handles.text5, 'String', ' ');
            pause(2);
            
        end
        
        
        cam(hObject, eventdata, handles);
        
        jpc = randi(5,1);
        whoswin(hObject, eventdata, handles);
        pause(3);
    end
    pause(5);
    set(handles.text5, 'String', 'Dí sí o no, ¿Quieres acabar?');
    axes(handles.axes10);
    imshow(nums{3});
    pause(1);
    imshow(nums{2});
    pause(1);
    imshow(nums{1});
    pause(1);
    imshow(imread('ya.png'));
    io = isover();
    imshow(imread('Imagen_fondo.png'));
    
    if io == 1
        set(handles.text5, 'String', 'Cerrando...');
        io=0;
        pause(2);
        close all;
    else
        set(handles.text5, 'String', 'Vale, Seguimos!');
        
        set(handles.text8, 'String', '');
        set(handles.text9, 'String', '');
        set(handles.text10, 'String', '');
        set(handles.text11, 'String', '');
        axes(handles.axes3);
        imshow(imread('Imagen_fondo.png'));
        axes(handles.axes6);
        imshow(imread('Imagen_fondo.png'));
        axes(handles.axes7);
        imshow(imread('Imagen_fondo.png'));
        axes(handles.axes8);
        imshow(imread('Imagen_fondo.png'));
        axes(handles.axes10);
        imshow(imread('Imagen_fondo.png'));
        pause(2);
    end
end


function whoswin(hObject, eventdata, handles)
global pl;
global jhv;
global jhm;
global jpc;
global nums;
global vs;
global ganadores_user;
global ganadores_pc;
axes(handles.axes6);
imshow(nums{jhm});
axes(handles.axes7);
imshow(vs);
axes(handles.axes8);
imshow(nums{jpc});


if (jhv==1 & mod(jhm+jpc,2)==0)| jhv==2 & mod(jhm+jpc,2)~=0
    pl = 2;
    set(handles.text4, 'String', 'Ha ganado usted');
    ganadores_user=ganadores_user+1;
    set(handles.text9, 'String', num2str(ganadores_user));
    set(handles.text11, 'String', num2str(ganadores_pc));
else    
    pl =1;
    set(handles.text4, 'String', 'Ha ganado el PC');
    ganadores_pc=ganadores_pc+1;
    set(handles.text9, 'String', num2str(ganadores_user));
    set(handles.text11, 'String', num2str(ganadores_pc));
end



function captura_mano(hObject, eventdata, handles)
global img;
global jhm;
imagen = imsubtract(img(:,:,1), rgb2gray(img));
imagen = medfilt2(imagen, [10 10]);
imb = im2bw(imagen,0.05);
ele = strel('square',10);
imagenaria = imopen(imb, ele);



%centrado de la imagen
imagenaria=bwlabel(imagenaria);
centro = regionprops(imagenaria,'Centroid');
giro = regionprops(imagenaria,'Orientation');

if giro.Orientation < 0
    angulo = -(giro.Orientation + 90);
else
    angulo = 90 - giro.Orientation;
end

centroids = cat(1, centro.Centroid);
imagen = imrotate(imagen,angulo);
imagenaria=imrotate(imagenaria,angulo);
%figure, imshow(imagenaria);

pos = size(imagenaria,1);
max_n = 0;
centro = regionprops(imagenaria,'Centroid');
centroids = cat(1, centro.Centroid);
pos = centroids(2);
imagenaria2=imagenaria;
while pos >=1
    imagenaria2(pos:size(imagenaria,1),:)=0;
    [~,n] = bwlabel(imagenaria2);
    if n > max_n
        max_n = n;
    end
    pos = pos - 100;
end
max_n2=max_n;
max_n = 0;
pos = centroids(2);
imagenaria(1:pos,:)=0;
pos = size(imagenaria,1);
while pos >= 1
    imagenaria(pos:size(imagenaria,1),:)=0;
    [~,n] = bwlabel(imagenaria);
    if n > max_n
        max_n = n;
    end
    pos = pos - 100;
end
if(max_n==2)
    max_n2=max_n2+1;
end
jhm=max_n2;
clearvars -global cam;


% --- Executes on button press in pushbutton3.
function cam(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
global img;
global cerrar;
cerrar = true;
cam = webcam(1);

axes(handles.axes3);
while cerrar
     img = snapshot(cam);
    imshow(img,[]);
    
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global cerrar;
global cam;
cerrar = false;
axes(handles.axes3);
imshow(img);
captura_mano(hObject, eventdata, handles)



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
