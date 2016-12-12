function varargout = interfazModeloExponencial(varargin)
%INTERFAZMODELOEXPONENCIAL M-file for interfazModeloExponencial.fig
%      INTERFAZMODELOEXPONENCIAL, by itself, creates a new INTERFAZMODELOEXPONENCIAL or raises the existing
%      singleton*.
%
%      H = INTERFAZMODELOEXPONENCIAL returns the handle to a new INTERFAZMODELOEXPONENCIAL or the handle to
%      the existing singleton*.
%
%      INTERFAZMODELOEXPONENCIAL('Property','Value',...) creates a new INTERFAZMODELOEXPONENCIAL using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazModeloExponencial_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZMODELOEXPONENCIAL('CALLBACK') and INTERFAZMODELOEXPONENCIAL('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZMODELOEXPONENCIAL.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazModeloExponencial

% Last Modified by GUIDE v2.5 11-Dec-2016 21:47:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazModeloExponencial_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazModeloExponencial_OutputFcn, ...
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


% --- Executes just before interfazModeloExponencial is made visible.
function interfazModeloExponencial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazModeloExponencial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazModeloExponencial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazModeloExponencial_OutputFcn(hObject, eventdata, handles)
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
close;
interfazPrincipal;



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

try
    
    ec = modeloExponencial(data);
    set(handles.resultado,'string',ec);
    
catch ME
      set(handles.errorTexto, 'string',ME.message);
end



function muestrasTexto_Callback(hObject, eventdata, handles)
% hObject    handle to muestrasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of muestrasTexto as text
%        str2double(get(hObject,'String')) returns contents of muestrasTexto as a double


% --- Executes during object creation, after setting all properties.
function muestrasTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to muestrasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonGenerar.
function botonGenerar_Callback(hObject, eventdata, handles)
m=str2double(get(handles.muestrasTexto,'String'));
table1 = zeros(m , 2);
set(handles.matriz,'data',table1);
set(handles.matriz,'ColumnName',{'xn','yn'});
set(handles.matriz,'ColumnEditable', [true true true true true true true true true true true true true true true true true true true true true true true true]);
set(handles.matriz,'visible', 'on');


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.muestrasTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.resultado,'string','');
set(handles.matriz,'data',[]);
