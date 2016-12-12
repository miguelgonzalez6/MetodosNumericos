function [ ecuacion ] = minimosCuadrados(matriz )
%Metodo de minimos cuadrados
%   input:
%       matriz: Esta es la matriz de los datos
%   output:
%       ecuación: es una cadena de texto con la ecuación solución

%Obtener los datos de la tabla
xi = matriz(:,1);
yi = matriz(:,2);
%hacer operaciones para obtener xi^2 y xi*yi
xi2 = xi .^ 2;
xiyi = xi .* yi;

%sacar las sumatorias
xi = sum(xi);
yi = sum(yi);
xi2 = sum(xi2);
xiyi = sum(xiyi);

%Obtener N
n = length(matriz(:,1));

%Operacion correspondiente para obtener m
M =  ((n * xiyi) - (xi * yi) ) / ( (n*xi2) - (xi^2));
%Operación para sacar b
B = (yi - (M * xi)) / n;
%Sacar el resultado 
ecuacion = ['Y = ' num2str(M) 'x' '+' num2str(B)];



end

