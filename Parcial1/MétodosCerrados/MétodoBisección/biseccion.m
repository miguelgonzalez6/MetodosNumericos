function [raiz, matrizResultados] = biseccion(func, xa, xb, ep, maxit)
% Metodo de bisección
%   [raiz,fx,ea,iter]=bisect(func,xa,xb,ep,maxit):
% Entrada:
%   func = nombre de la función
%   xa, xb = valores del intervalo
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo número de iteraciones que se aceptan (default = 50)
% Salida:
%   raíz = el valor de la raíz 
%   matrizResultados = es la matriz de los resultados obtenidos para
%   mostrarla en la tabla gráfica

%Validación por si la función esta vacía
if isempty(func), error('la función esta vacia') ,end
func = inline(func);
%validar la función si es correcta
func(1);

%Validación xa
if isnan(xa)
    error('error el xa esta vacío o no es un número valido');
end
%Validacion xb
if isnan(xb)
    error('error el xb esta vacío o no es un número valido');
end

%Validación si el intervalo es cerrado
test = func(xa) * func(xb);
%Sino cambia de signo entonces los intervalos son incorrectos
if test > 0, error('Intervalos incorrectos!'); end

%Aquí se hace el calculo del error relativo 
%Sino se dan cifrasSig. por default se dan 5 y el error relativo es: 0.0005
if isnan(ep) 
    ep = 0.0005; 
else
    ep = (0.5*10^(2-ep));
end
%Sino se le da un número  maximo de iteración el número de iteraciones por
%defaul es 50 iteraciones
if isnan(maxit), maxit = 50; end
iter = 0; xMedia = 0; ea = 0;
matrizResultados = [];

while(1)
    xMediaPasado = xMedia;
    xMedia = (xa + xb) / 2;
    iter = iter + 1;
    if xMedia ~= 0, ea = abs((xMedia - xMediaPasado)/xMedia) * 100;end
    
    fila = [iter, xa, func(xa), xb, func(xb), xMedia, func(xMedia),ea];
    matrizResultados = [matrizResultados ; fila];
    
    test = func(xa) * func(xMedia);
    if test < 0
        xb = xMedia;
    elseif test > 0 
        xa = xMedia;
    else
        ea = 0;
    end
    if ea <= ep || iter >= maxit, break, end
end
raiz = xMedia;
end


