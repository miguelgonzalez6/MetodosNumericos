function x = gauss( matriz )
%GAUSS2 Summary of this function goes here
%   Detailed explanation goes here

%Sacar los datos requeridos
[m,n] = size(matriz);

for i = 1 : n-1
    %Divido la fila entre el pivote para hacerlo uno
    matriz(i,:) = matriz(i,:) / (matriz(i,i));
    for k = i+1 : m
        %Esta variable es el multiplicador
        multiplicador = -matriz(k,i);
        %Hacer las operaciones para hacer ceros abajo del pivote
        matriz(k,:) = (matriz(i,:)*multiplicador) + matriz(k,:); 
    end
end

%Sustitución
x = zeros(m,1);
x(m) = matriz(m,n)/matriz(m,n-1);

for i = m-1:-1:1
    %Obtener los elementos despues del pivote
    elementos = matriz(i,i+1:m);
    mult = x(i+1:m);
    elementos = elementos*mult;
    valor = matriz(i,n);
    x(i) = (-elementos+valor);
end

%Comprobar si tiene solucion
b = matriz(:,n);
for i = 1:m
    resultado1 = matriz(i,1:n-1) * x;
    resultado2 = double(b(i));
    res = resultado1 - resultado2;
    if round(res) > 0
        error('Esta ecuación no tiene solución');
    end
end
    
