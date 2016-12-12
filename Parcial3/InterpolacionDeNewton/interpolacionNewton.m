
%FUNCION QUE OBTIENE EL POLINOMIO GENERARDOR POR INTERPOLACION DE NEWTON

%De paramentros se ingresan los vectores de los valores de x y la f(x) 
%Se utilizan variables para resultado, donde C es un vector y polinomio un String
function [C,polinomio]=interpolacionNewton(x,f)
    n1=length(x);
    n=n1-1;
    %Se inicializa C con ceros fa que sera una matriz a la cual
    %estaremos metiendo los valores de los resultados la tabla de Newton
    C=zeros(n+1);
    C(:,1)=f;
    for k=2:n+1
        for J=k:n+1
            %Operacion donde se realiza la forma de Newton y se llena en tabla
            C(J,k)=(C(J,k-1)-C(J-1,k-1))/(x(J)-x(J-k+1));
        end
    end
    
    %En esta parte se recorre el arreglo de resultados para poder
    %generar el polinomio como un String, 
    %la variable X simboliza el caractes de la incognita en el String
    syms X;
    polinomio=C(1,1);
    P=1;
    %Recorremos diagonalmente el vector obtenido de los calculos de Newton
    for i=1:n
        P=P*(X-x(i));
        polinomio=polinomio+P*C(i+1,i+1);
    end
    %Metodo expand funciona para resolver y simplificar una ecuacion
    polinomio=expand(polinomio);
    

