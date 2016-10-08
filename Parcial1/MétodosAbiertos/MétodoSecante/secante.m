function [raiz, matrizResultados] = secante(func, xi0, xi, ep, maxit)
% Metodo de la secante
% Entrada:
%   func = nombre de la función
%   xi0 = es el valor inicial xi - 1
%   xi= es el valor inicial xi
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo número de iteraciones que se aceptan (default = 50)
% Salida:
%   raíz = el valor de la raíz 
%   matrizResultados = es la matriz de los resultados obtenidos para
%   mostrarla en la tabla gráfica

%Validación por si la función esta vacía
if isempty(func), error('la función esta vacia') ,end
func = inline(func);
%evaluar la función para ver si es correcta
func(1);

%Validación xi-1
if isnan(xi0)
    error('error el xi-1 esta vacío o es una cadena de caracteres');
end
%Validación xi
if isnan(xi)
    error('error el xi esta vacío o es una cadena de caracteres');
end
%Validación si el intervalo es cerrado
test = func(xi0) * func(xi);
%Sino cambia de signo entonces los intervalos son incorrectos
if test > 0, error('Intervalos incorrectos!'); end
%Aquí se hace el calculo del error relativo 
%Sino se dan cifras por default se dan 5 y el error relativo es: 0.0005
if isnan(ep) 
    ep = 0.0005; 
else
    ep = (0.5*10^(2-ep));
end
%Sino se le da un número  maximo de iteración el número de iteraciones por
%defaul es 50 iteraciones
if isnan(maxit), maxit = 50; end
iter = 0; matrizResultados = [];
ea = 0;
while(1)
    xiold = xi;
    xi = xi - (( func(xi) * (xi0 - xi)) / (func(xi0) - func(xi))  );
    %aumento la iteración
    iter = iter + 1;
    %saco el error relativo
    if xi ~= 0, ea = abs((xi - xiold) / xi) * 100; end
    %hago un arreglo que sera la fila siguiente de la matriz
    fila = [iter, xi0, func(xi0), xiold, func(xiold), xi, func(xi), ea];
    %Se agrega la fila a la matriz
    matrizResultados = [matrizResultados ; fila];
    %cambiar el valor de xi-1 al valor que tenía xi
    xi0 = xiold;
    if ea <= ep || iter >= maxit, break, end
end
raiz = xi;
end


