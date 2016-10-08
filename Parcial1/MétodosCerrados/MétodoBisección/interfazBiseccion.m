function varargout = interfazBiseccion(varargin)
%INTERFAZBISECCION M-file for interfazBiseccion.fig
%      INTERFAZBISECCION, by itself, creates a new INTERFAZBISECCION or raises the existing
%      singleton*.
%
%      H = INTERFAZBISECCION returns the handle to a new INTERFAZBISECCION or the handle to
%      the existing singleton*.
%
%      INTERFAZBISECCION('Property','Value',...) creates a new INTERFAZBISECCION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazBiseccion_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZBISECCION('CALLBACK') and INTERFAZBISECCION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZBISECCION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazBiseccion

% Last Modified by GUIDE v2.5 05-Oct-2016 17:24:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazBiseccion_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazBiseccion_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before interfazBiseccion is made visible.
function interfazBiseccion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazBiseccion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazBiseccion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazBiseccion_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);


% --- Executes on button press in botonAtras.
function botonAtras_Callback(hObject, eventdata, handles)
%Se cierra la ventana actual y se abre la ventana principal
close;
interfazPrincipal;


% --- Executes on button press in botonResolver.
function botonResolver_Callback(hObject, eventdata, handles)
%Se obtiene la función
funcionText = get(handles.funcionTexto,'string');
%Se obtiene xa
xa =  str2double(get(handles.xaTexto,'string'));
%Se obtiene xb
xb = str2double(get(handles.xbTexto,'string'));
%Se obtiene las cifras significativas(ep)
ep = str2double(get(handles.eaTexto,'string'));
%Se obtiene el número maximo de iteraciones 
maxit = str2double(get(handles.iteracionesTexto,'string'));

try
    %Se llama a la función que resuelve el método y le introducimos los datos
    [raiz , matrizResultados] = biseccion(funcionText, xa, xb, ep, maxit);
    %Meter los datos a la tabla
    set(handles.tabla, 'data', matrizResultados);
    %Meter el valor de la raíz al texto'
    set(handles.raizTexto,'String',num2str(raiz));
    
    %Si todo salió bien quito el error que se mostro en la interfaz
    set(handles.errorTexto, 'string', '');
catch ME
    set(handles.errorTexto,'string',ME.message);
end



function funcionTexto_Callback(hObject, eventdata, handles)
% hObject    handle to funcionTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcionTexto as text
%        str2double(get(hObject,'String')) returns contents of funcionTexto as a double


% --- Executes during object creation, after setting all properties.
function funcionTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcionTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xaTexto_Callback(hObject, eventdata, handles)
% hObject    handle to xaTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xaTexto as text
%        str2double(get(hObject,'String')) returns contents of xaTexto as a double


% --- Executes during object creation, after setting all properties.
function xaTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xaTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xbTexto_Callback(hObject, eventdata, handles)
% hObject    handle to xbTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xbTexto as text
%        str2double(get(hObject,'String')) returns contents of xbTexto as a double


% --- Executes during object creation, after setting all properties.
function xbTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xbTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eaTexto_Callback(hObject, eventdata, handles)
% hObject    handle to eaTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eaTexto as text
%        str2double(get(hObject,'String')) returns contents of eaTexto as a double


% --- Executes during object creation, after setting all properties.
function eaTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eaTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iteracionesTexto_Callback(hObject, eventdata, handles)
% hObject    handle to iteracionesTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iteracionesTexto as text
%        str2double(get(hObject,'String')) returns contents of iteracionesTexto as a double


% --- Executes during object creation, after setting all properties.
function iteracionesTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracionesTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
%Abrir la pantalla principal
interfazPrincipal;


% --- esta función se ejecuta cuando se presiona el botonGraficar.
function botonGraficar_Callback(hObject, eventdata, handles)
funcionTexto = get(handles.funcionTexto,'string');

try
    if isempty(funcionTexto), error('La función esta vacía.'),end
    %se convierte la funcion
    funcion = inline(funcionTexto);
    %Se grafica con la función ezplot
    ezplot(funcion);
    grid on;
catch ME
    set(handles.errorTexto, 'string',ME.message);
    
end


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.funcionTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.xaTexto,'string','');
set(handles.xbTexto,'string','');
set(handles.eaTexto,'string','');
set(handles.iteracionesTexto,'string','');
set(handles.raizTexto,'string','');
set(handles.tabla,'data',[]);
ezplot('');
