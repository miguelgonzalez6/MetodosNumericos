function [ ecuacion ] = minimosCuadrados(matriz )
%Metodo de minimos cuadrados
%   input:
%       matriz: Esta es la matriz de los datos
%   output:
%       ecuación: es una cadena de texto con la ecuación solución

%Obtener los datos de la tabla
xn = matriz(:,1);
yn = matriz(:,2);
%Obtener lnYn
lnyn = log(yn);
%Obtener xn^2
xn2 = xn .^ 2;
%Obtener xnLnYn
xnlnyn = xn .* lnyn;

%sacar las sumatorias
lnyn = sum(lnyn);
xn2 = sum(xn2);
xnlnyn = sum(xnlnyn);
xn = sum(xn);


%Obtener N
n = length(matriz(:,1));

%Operacion correspondiente para obtener m
M =  ( (xnlnyn * n) - (lnyn * xn) ) / ( (xn2 * n) - (xn * xn)) ;

%Operación para sacar lnb
lnb = ( (xn2 * lnyn) - (xn * xnlnyn) )  / ( (xn2 * n) - (xn * xn) ) ;
%Operación para sacar b
B = exp(lnb);
%Sacar el resultado 
ecuacion = ['YN = ' num2str(round(B)) 'e^' num2str(round(M)) 'xn'];



end

