function varargout = interfazNewtonRaphson(varargin)
%INTERFAZNEWTONRAPHSON M-file for interfazNewtonRaphson.fig
%      INTERFAZNEWTONRAPHSON, by itself, creates a new INTERFAZNEWTONRAPHSON or raises the existing
%      singleton*.
%
%      H = INTERFAZNEWTONRAPHSON returns the handle to a new INTERFAZNEWTONRAPHSON or the handle to
%      the existing singleton*.
%
%      INTERFAZNEWTONRAPHSON('Property','Value',...) creates a new INTERFAZNEWTONRAPHSON using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazNewtonRaphson_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZNEWTONRAPHSON('CALLBACK') and INTERFAZNEWTONRAPHSON('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZNEWTONRAPHSON.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazNewtonRaphson

% Last Modified by GUIDE v2.5 05-Oct-2016 23:23:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazNewtonRaphson_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazNewtonRaphson_OutputFcn, ...
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


% --- Executes just before interfazNewtonRaphson is made visible.
function interfazNewtonRaphson_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazNewtonRaphson
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazNewtonRaphson wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazNewtonRaphson_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);



% --- Executes on button press in botonAtras.
function botonAtras_Callback(hObject, eventdata, handles)
%Cuando se da el boton de atras se cierra la ventana actual y se abre la
%ventana principal
close;
interfazPrincipal;


% --- Executes on button press in botonResolver.
function botonResolver_Callback(hObject, eventdata, handles)
%Se obtiene la función
funcionText = get(handles.funcionTexto,'string');
%Se obtiene la variable y lo convierto a minuscula para que no haya
%problemas sensitivos
variableText = get(handles.variableTexto,'string');
%En esta parte saco la derivada de la función
%Valido si esta vacía si lo esta agarro la x como valor default
if isempty(variableText), variableText = 'x'; end
%se deriva la función
dFuncionText = char ( diff(funcionText, sym(variableText)) );
%Se obtiene xn
xn =  str2double(get(handles.xnTexto,'string'));
%Se obtienen las cifras significativas(ep)
ep = str2double(get(handles.eaTexto,'string'));
%Se obtiene el número maximo de iteraciones 
maxit = str2double(get(handles.iteracionesTexto,'string'));

try
    %Se llama a la función que resuelve el método y le introducimos los datos
    [raiz , matrizResultados] = newtonRaphson(funcionText, dFuncionText, xn, ep, maxit);
    %Si todo esta bien muestro la derivada de la función
    set(handles.dFuncionTexto,'string', dFuncionText); 
    %Meter los datos a la tabla
    set(handles.tabla, 'data', matrizResultados);
    %Meter el valor de la raíz al texto'
    set(handles.raizTexto,'String',num2str(raiz));
    %Si todo salió bien quito el error que se mostro en la interfaz
    set(handles.errorTexto, 'string', '');
catch ME
    set(handles.errorTexto,'string',ME.message);
end


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
set(handles.dFuncionTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.xnTexto,'string','');
set(handles.eaTexto,'string','');
set(handles.iteracionesTexto,'string','');
set(handles.raizTexto,'string','');
set(handles.tabla,'data',[]);
ezplot('');



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



function xnTexto_Callback(hObject, eventdata, handles)
% hObject    handle to xnTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xnTexto as text
%        str2double(get(hObject,'String')) returns contents of xnTexto as a double


% --- Executes during object creation, after setting all properties.
function xnTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xnTexto (see GCBO)
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



function dFuncionTexto_Callback(hObject, eventdata, handles)
% hObject    handle to dFuncionTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dFuncionTexto as text
%        str2double(get(hObject,'String')) returns contents of dFuncionTexto as a double


% --- Executes during object creation, after setting all properties.
function dFuncionTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dFuncionTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function variableTexto_Callback(hObject, eventdata, handles)
% hObject    handle to variableTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of variableTexto as text
%        str2double(get(hObject,'String')) returns contents of variableTexto as a double


% --- Executes during object creation, after setting all properties.
function variableTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to variableTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
