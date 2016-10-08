function [raiz, matrizResultados] = biseccion(func, xa, xb, ep, maxit)
% Metodo de bisecci�n
%   [raiz,fx,ea,iter]=bisect(func,xa,xb,ep,maxit):
% Entrada:
%   func = nombre de la funci�n
%   xa, xb = valores del intervalo
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo n�mero de iteraciones que se aceptan (default = 50)
% Salida:
%   ra�z = el valor de la ra�z 
%   matrizResultados = es la matriz de los resultados obtenidos para
%   mostrarla en la tabla gr�fica

%Validaci�n por si la funci�n esta vac�a
if isempty(func), error('la funci�n esta vacia') ,end
func = inline(func);
%validar la funci�n si es correcta
func(1);

%Validaci�n xa
if isnan(xa)
    error('error el xa esta vac�o o no es un n�mero valido');
end
%Validacion xb
if isnan(xb)
    error('error el xb esta vac�o o no es un n�mero valido');
end

%Validaci�n si el intervalo es cerrado
test = func(xa) * func(xb);
%Sino cambia de signo entonces los intervalos son incorrectos
if test > 0, error('Intervalos incorrectos!'); end

%Aqu� se hace el calculo del error relativo 
%Sino se dan cifrasSig. por default se dan 5 y el error relativo es: 0.0005
if isnan(ep) 
    ep = 0.0005; 
else
    ep = (0.5*10^(2-ep));
end
%Sino se le da un n�mero  maximo de iteraci�n el n�mero de iteraciones por
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


