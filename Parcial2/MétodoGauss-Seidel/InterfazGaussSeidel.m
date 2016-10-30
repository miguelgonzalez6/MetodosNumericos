function varargout = InterfazGaussSeidel(varargin)
%INTERFAZGAUSSSEIDEL M-file for InterfazGaussSeidel.fig
%      INTERFAZGAUSSSEIDEL, by itself, creates a new INTERFAZGAUSSSEIDEL or raises the existing
%      singleton*.
%
%      H = INTERFAZGAUSSSEIDEL returns the handle to a new INTERFAZGAUSSSEIDEL or the handle to
%      the existing singleton*.
%
%      INTERFAZGAUSSSEIDEL('Property','Value',...) creates a new INTERFAZGAUSSSEIDEL using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to InterfazGaussSeidel_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZGAUSSSEIDEL('CALLBACK') and INTERFAZGAUSSSEIDEL('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZGAUSSSEIDEL.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfazGaussSeidel

% Last Modified by GUIDE v2.5 28-Oct-2016 16:36:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfazGaussSeidel_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfazGaussSeidel_OutputFcn, ...
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


% --- Executes just before InterfazGaussSeidel is made visible.
function InterfazGaussSeidel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for InterfazGaussSeidel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfazGaussSeidel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfazGaussSeidel_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botonAtras.
function botonAtras_Callback(hObject, eventdata, handles)
% hObject    handle to botonAtras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado as text
%        str2double(get(hObject,'String')) returns contents of resultado as a double


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonResolver.
function botonResolver_Callback(hObject, eventdata, handles)
%Obtener la matriz de la interfaz
data = get(handles.matriz,'data');
%Obtener el número de cifras significativas
cifras = get(handles.cifrasSignificativasText,'string');
%Obtener el número maximo de iteraciones
maxit = get(handles.iteracionesText,'string');

resultados = [];
try
    %Resolver llamando a la función
    resultados = gaussSeidel(data, cifras, maxit);
catch e
    set(handles.errorTexto,'String',e.message);
end

%Poner los resultados en la interfaz
resultadosString = [];
[n, m] = size(resultados);

for i = 1 : n
    resultadosString = [resultadosString ; 'x' num2str(i) '=  '];
end

%mostrarlo en la grafica
set(handles.resultado,'string',[resultadosString num2str(resultados)]);
%Quitar los errores si hubo
set(handles.errorTexto,'string','');



function incognitasTexto_Callback(hObject, eventdata, handles)
% hObject    handle to incognitasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of incognitasTexto as text
%        str2double(get(hObject,'String')) returns contents of incognitasTexto as a double


% --- Executes during object creation, after setting all properties.
function incognitasTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to incognitasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonGenerar.
function botonGenerar_Callback(hObject, eventdata, handles)
m=str2double(get(handles.incognitasTexto,'String'));
n=m+1;
table1 = zeros(m,n);
set(handles.matriz,'data',table1);
set(handles.matriz,'ColumnEditable', [true true true true true true true true true true true true true true true true true true true true true true true true]);
set(handles.matriz,'visible','on');


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.incognitasTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.resultado,'string','');
set(handles.matriz,'data',[]);
set(handles.cifrasSignificativasText,'string','');
set(handles.iteracionesText,'string','');



function cifrasSignificativasText_Callback(hObject, eventdata, handles)
% hObject    handle to cifrasSignificativasText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cifrasSignificativasText as text
%        str2double(get(hObject,'String')) returns contents of cifrasSignificativasText as a double


% --- Executes during object creation, after setting all properties.
function cifrasSignificativasText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cifrasSignificativasText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iteracionesText_Callback(hObject, eventdata, handles)
% hObject    handle to iteracionesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iteracionesText as text
%        str2double(get(hObject,'String')) returns contents of iteracionesText as a double


% --- Executes during object creation, after setting all properties.
function iteracionesText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracionesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
