function varargout = interfazfalsaPosicion(varargin)
%INTERFAZFALSAPOSICION M-file for interfazfalsaPosicion.fig
%      INTERFAZFALSAPOSICION, by itself, creates a new INTERFAZFALSAPOSICION or raises the existing
%      singleton*.
%
%      H = INTERFAZFALSAPOSICION returns the handle to a new INTERFAZFALSAPOSICION or the handle to
%      the existing singleton*.
%
%      INTERFAZFALSAPOSICION('Property','Value',...) creates a new INTERFAZFALSAPOSICION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazfalsaPosicion_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZFALSAPOSICION('CALLBACK') and INTERFAZFALSAPOSICION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZFALSAPOSICION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazfalsaPosicion

% Last Modified by GUIDE v2.5 05-Oct-2016 17:25:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazfalsaPosicion_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazfalsaPosicion_OutputFcn, ...
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


% --- Executes just before interfazfalsaPosicion is made visible.
function interfazfalsaPosicion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazfalsaPosicion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazfalsaPosicion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazfalsaPosicion_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%Se obtiene la función
funcionText = get(handles.funcionTexto,'string');
%Se obtiene xi
xi =  str2double(get(handles.xiTexto,'string'));
%Se obtiene xf
xf = str2double(get(handles.xfTexto,'string'));
%Se obtiene las cifras significativas(ep)
ep = str2double(get(handles.eaTexto,'string'));
%Se obtiene el número maximo de iteraciones 
maxit = str2double(get(handles.iteracionesTexto, 'string'));

try
    %Se llama a la función que resuelve el método y le introducimos los datos
    [raiz , matrizResultados] = falsaPosicion(funcionText, xi, xf, ep, maxit);
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



function xiTexto_Callback(hObject, eventdata, handles)
% hObject    handle to xiTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xiTexto as text
%        str2double(get(hObject,'String')) returns contents of xiTexto as a double


% --- Executes during object creation, after setting all properties.
function xiTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xiTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xfTexto_Callback(hObject, eventdata, handles)
% hObject    handle to xfTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xfTexto as text
%        str2double(get(hObject,'String')) returns contents of xfTexto as a double


% --- Executes during object creation, after setting all properties.
function xfTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xfTexto (see GCBO)
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
%Abrir interfaz principal
interfazPrincipal;


% --- Executes on button press in botonGraficar.
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
set(handles.xiTexto,'string','');
set(handles.xfTexto,'string','');
set(handles.eaTexto,'string','');
set(handles.iteracionesTexto,'string','');
set(handles.raizTexto,'string','');
set(handles.tabla,'data',[]);
%Limpiamos la grafica
cla reset;