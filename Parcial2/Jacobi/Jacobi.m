function x = Jacobi( matriz,ep,maxit)
%Metodo de Jacobi
% Entrada:
%   matriz = matriz aumentada
%   ep = tolerancia (default = 0.0005%)
%   maxit = maximo número de iteraciones que se aceptan (default = 50)
% Salida:
%   x = el arreglo con los valores de las incognitas

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

%Sacar el tamaño de la matriz total para pasar los datos requeridos
[m, n] = size(matriz);

%Pasar los coeficientes a la matriz A
for i = 1:n-1
    A(:,i) = matriz(:,i); 
end
%Pasar la matriz unitaria derecha a la variable b para utilizarla
b = matriz(:,n);
[m,n] = size(A);
C = A;
%Quitar los valores de las incognitas
for i = 1:n
    C(i,i) = 0;
    x(i) = 0;
end
%Hacer la x como vector unitario para poder multiplicarlo
x = x';

for i = 1:n
    C(i,1:n) = C(i,1:n)/A(i,i);
end
for i = 1:n
    d(i) = b(i)/A(i,i);
end
iter = 0;
aux = x;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
while (1)
    xold = x;
    for i = 1:n 
        x(i) = d(i)-C(i,:)*aux;
        if x(i) ~= 0
            ea(i) = abs((x(i) - xold(i))/x(i)) * 100;   
        end
    end
    aux = x;
    iter = iter+1;
    if max(ea) <= ep || iter >= maxit, break, end
end

%Comprobar si tiene solucion
% for i = 1:n
%     resultado1 = A(i,1:n) * x;
%     resultado2 = double(b(i));
%     res = resultado1 - resultado2;
%     if round(res) > 0
%         error('Esta ecuación no tiene solución');
%     end
% end



