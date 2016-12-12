function varargout = interfazPrincipal(varargin)
%INTERFAZPRINCIPAL M-file for interfazPrincipal.fig
%      INTERFAZPRINCIPAL, by itself, creates a new INTERFAZPRINCIPAL or raises the existing
%      singleton*.
%
%      H = INTERFAZPRINCIPAL returns the handle to a new INTERFAZPRINCIPAL or the handle to
%      the existing singleton*.
%
%      INTERFAZPRINCIPAL('Property','Value',...) creates a new INTERFAZPRINCIPAL using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazPrincipal_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZPRINCIPAL('CALLBACK') and INTERFAZPRINCIPAL('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZPRINCIPAL.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazPrincipal

% Last Modified by GUIDE v2.5 11-Dec-2016 18:33:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazPrincipal_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazPrincipal_OutputFcn, ...
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


% --- Executes just before interfazPrincipal is made visible.
function interfazPrincipal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazPrincipal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazPrincipal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazPrincipal_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);



%Esto se ejecuta cuando se elige una opción en el pop-up de los métodos
%cerrados
function MetodosCerradosPopUp_Callback(hObject, eventdata, handles)
opcionElegida = get(hObject, 'Value');

switch opcionElegida
    %Esta es la opción del método de la bisección
    case 2
        close;
        interfazBiseccion;
    %Esta es la opción del método de la falsa posición 
    case 3
        close;
        interfazfalsaPosicion;
end

% --- Executes during object creation, after setting all properties.
function MetodosCerradosPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MetodosCerradosPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MetodosAbiertosPopUp.
function MetodosAbiertosPopUp_Callback(hObject, eventdata, handles)
opcionElegida = get(hObject, 'Value');

switch opcionElegida
    %Esta es la opción del método de Newton-Raphson
    case 2
        close;
        interfazNewtonRaphson;
    %Esta es la opción del método de la secante 
    case 3
        close;
        interfazSecante;
end
        
% --- Executes during object creation, after setting all properties.
function MetodosAbiertosPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MetodosAbiertosPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)


% --- Executes on selection change in SistemasEcuacionesPopUpMenu.
function SistemasEcuacionesPopUpMenu_Callback(hObject, eventdata, handles)
opcionElegida = get(hObject, 'Value');

switch opcionElegida
    %Esta es la opción del método de Gauss
    case 2
        close;
        InterfazGauss;
    %Esta es la opción del método de Gauss-Jordan 
    case 3
        close;
        InterfazGJ;
    %Esta es la opción del método de Montante
    case 4
        close;
        InterfazMontana;
    %Esta es la opción del método de Cramer
    case 5
        close;
        InterfazCramer;
    %Esta es la opción del método de Gauss-Seidel
    case 6
        close;
        InterfazGaussSeidel;
    %Esta es la opción del método de Gauss-Jacobi 
    case 7
        close;
        InterfazGJacobi;
end


% --- Executes during object creation, after setting all properties.
function SistemasEcuacionesPopUpMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SistemasEcuacionesPopUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in InterpolacionYAjuestesDeFuncionesPopUpMenu.
function InterpolacionYAjuestesDeFuncionesPopUpMenu_Callback(hObject, eventdata, handles)
opcionElegida = get(hObject, 'Value');

switch opcionElegida
    %Esta es la opción del método de Minimos Cuadrados
    case 2
        close;
        interfazMinimosCuadrados;
    %Esta es la opción del metodo de exponencial
    case 3
        close;
        interfazModeloExponencial;
    %Esta es la opción del método de interpolación de Newton
    case 4
        close;
        interfazInterpolacionNewton;
    %Esta es la opción del método de Lagrange
    case 5
        close;
        interfazLagrange;
end


% --- Executes during object creation, after setting all properties.
function InterpolacionYAjuestesDeFuncionesPopUpMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InterpolacionYAjuestesDeFuncionesPopUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
