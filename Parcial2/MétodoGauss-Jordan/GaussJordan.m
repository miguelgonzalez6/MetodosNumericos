
function matriz = GaussJordan( matriz )
%GmatrizUSS2 Summmatrizry of this function goes here
%   Detmatriziled explmatriznmatriztion goes here

%Sacar los datos requerido
[m,n]=size(matriz);

for j=1:m-1
    for z=2:m
        if matriz(j,j)==0
            t=matriz(1,:);matriz(1,:)=matriz(z,:);
            matriz(z,:)=t;
        end
    end
    for i=j+1:m
        matriz(i,:)=matriz(i,:)-matriz(j,:)*(matriz(i,j)/matriz(j,j));
    end
end

for j=m:-1:2
    for i=j-1:-1:1
        matriz(i,:)=matriz(i,:)-matriz(j,:)*(matriz(i,j)/matriz(j,j));
    end
end

for s=1:m
    matriz(s,:)=matriz(s,:)/matriz(s,s);
    %x(s)=matriz(s,n);
end

