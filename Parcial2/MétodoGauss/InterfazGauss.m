function varargout = InterfazGauss(varargin)
% INTERFAZGAUSS MATLAB code for InterfazGauss.fig
%      INTERFAZGAUSS, by itself, creates a new INTERFAZGAUSS or raises the existing
%      singleton*.
%
%      H = INTERFAZGAUSS returns the handle to a new INTERFAZGAUSS or the handle to
%      the existing singleton*.
%
%      INTERFAZGAUSS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZGAUSS.M with the given input arguments.
%
%      INTERFAZGAUSS('Property','Value',...) creates a new INTERFAZGAUSS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfazGauss_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfazGauss_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfazGauss

% Last Modified by GUIDE v2.5 24-Oct-2016 23:45:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfazGauss_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfazGauss_OutputFcn, ...
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


% --- Executes just before InterfazGauss is made visible.
function InterfazGauss_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfazGauss (see VARARGIN)

% Choose default command line output for InterfazGauss
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfazGauss wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfazGauss_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botonAtras.
function botonAtras_Callback(hObject, eventdata, handles)
%Cuando se da el boton de atras se cierra la ventana actual y se abre la
%ventana principal
close;
interfazPrincipal;



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
table1 = zeros(m , n);
set(handles.matriz,'data',table1);
set(handles.matriz,'ColumnEditable', [true true true true true true true true true true true true true true true true true true true true true true true true]);
set(handles.matriz,'visible','on');


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.incognitasTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.resultado,'string','');
set(handles.matriz,'data',[]);



% --- Executes on selection change in resultado.
function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resultado contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resultado


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- se ejecuta cuando se presiona el boton resolver
function botonResolver_Callback(hObject, eventdata, handles)
%Obtener la matriz de la interfaz
data = get(handles.matriz,'data');

resultados = [];
try
    %Resolver llamando la funci�n de gauss
    resultados = gauss(data);
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

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
%Abrir la pantalla principal
interfazPrincipal;
