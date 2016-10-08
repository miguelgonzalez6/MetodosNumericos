function [raiz, matrizResultados] = falsaPosicion(func, xi, xf, ep, maxit)
% Metodo de la falsa posici�n
%   [raiz,fx,ea,iter]=bisect(func,xi,xf,ep,maxit):
% Entrada:
%   func = nombre de la funci�n en string
%   xi, xf = valores del intervalo
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo n�mero de iteraciones que se aceptan (default = 50)
% Salida:
%   ra�z = el valor de la ra�z 
%   matrizResultados = es la matriz de los resultados obtenidos para
%   mostrarla en la tabla gr�fica

%Validaci�n de la funci�n
if isempty(func), error('la funci�n esta vacia'),end
func = inline(func);

%evaluar la funci�n para ver si es correcta
func(1);

%Validaci�n xa
if isnan(xi)
    error('error el xi esta vac�o o no es un n�mero valido');
end
%Validacion xb
if isnan(xf)
    error('error el xf esta vac�o o no es un n�mero valido');
end

%Validaci�n si el intervalo es cerrado
test = func(xi) * func(xf);
%Sino cambia de signo entonces los intervalos son incorrectos
if test > 0, error('Intervalos incorrectos!'); end

%Aqu� se hace el calculo del error relativo 
%Sino se dan cifrasSig. por default se dan 5 y el error relativo es: 0.0005
if nargin < 4 || isnan(ep) 
    ep = 0.0005; 
else
    ep = (0.5*10^(2-ep));
end
%Sino se le da un n�mero  maximo de iteraci�n el n�mero de iteraciones por
%defaul es 50 iteraciones
if nargin < 5 || isnan(maxit), maxit=50; end
iter = 0; xc = 0; ea = 0;
matrizResultados = [];
while(1)
    xcPasado = xc;
    xc = xi - ( ( func(xi) * (xi - xf) ) / (func(xi) - func(xf)) );
    iter = iter + 1;
    if xc ~= 0, ea = abs((xc - xcPasado)/xc) * 100;end
    
    fila = [iter, xi, func(xi), xf, func(xf), xc, func(xc),ea];
    matrizResultados = [matrizResultados ; fila];
    
    test = func(xi) * func(xc);
    if test < 0
        xf = xc;
    elseif test > 0 
        xi = xc;
    else
        ea = 0;
    end
    if ea <= ep || iter >= maxit, break, end
end
raiz = xc;
end


