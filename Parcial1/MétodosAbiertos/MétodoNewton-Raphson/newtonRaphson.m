function [raiz, matrizResultados] = newtonRaphson(func, dfunc, xn, ep, maxit)
% Metodo de newtonRaphson
% Entrada:
%   func = nombre de la funci�n
%   dfunc = es la primera derivada de la funci�n
%   xn= valor de inicio
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo n�mero de iteraciones que se aceptan (default = 50)
%   variable = esta es la variable a utilizar para la funcion
% Salida:
%   ra�z = el valor de la ra�z 
%   matrizResultados = es la matriz de los resultados obtenidos para
%   mostrarla en la tabla gr�fica

%Validaci�n por si la funci�n esta vac�a
if isempty(func), error('la funci�n esta vacia') ,end
func = inline(func);
%para validar la funcion
func(1)

dfunc = inline(dfunc);
if dfunc(1) == 0, error('variable invalida'),end
%Validaci�n xa
if isnan(xn)
    error('error el xn esta vac�o o es una cadena de caracteres');
end

%Aqu� se hace el calculo del error relativo 
%Sino se dan cifras por default se dan 5 y el error relativo es: 0.0005
if isnan(ep) 
    ep = 0.0005; 
else
    ep = (0.5*10^(2-ep));
end
%Sino se le da un n�mero  maximo de iteraci�n el n�mero de iteraciones por
%defaul es 50 iteraciones
if isnan(maxit), maxit = 50; end

iter = 0; matrizResultados = [];
while (1)
    xnold = xn;
    xn = xn - func(xn) / dfunc(xn);
    iter = iter + 1;
    if xn ~= 0, ea = abs((xn - xnold) / xn) * 100; end
    %hago un arreglo que sera la fila siguiente de la matriz
    fila = [iter, xnold, func(xnold), dfunc(xnold), xn, func(xn), ea ];
    %Se agrega la fila a la matriz
    matrizResultados = [matrizResultados ; fila];

    if ea <= ep || iter >= maxit, break, end
end
raiz = xn;
end


