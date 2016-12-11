%FUNCION QUE OBTIENE EL POLINOMIO GENERARDOR POR INTERPOLACION DE LAGRANGE
%Y POR CUALQUIER TIPO DE MODELO.

%De paramentros se ingresan los vectores de los valores de x y la f(x) 
%Se utilizan variables para resultado, donde C es un vector y polinomio un String
function [C,polinomio]=lagrange(x,f)
    n1=length(x);
    n=n1-1;
    L=zeros(n1,n1);
    for k=1:n+1 
        V=1; 
        for j=1:n+1 
            if k~=j; 
                %Se utiliza la funcion conv que multiplica polinomios
                V=conv(V,poly(x(j)))/(x(k)-x(j)); 
            end
        end
        %Guardamos el resultado de la multiplicacion de polinomios en el vector L
        L(k,:)=V;
    end
    %Vector resultante con los valores finales del polinomio
    C=f*L;
    
    %En esta parte se recorre el arreglo de resultados para poder
    %generar el polinomio como un String
    polinomio = '';
    coeficiente=n;
    for i = 1 : n+1
        %Si el valor es un numero que no esta entre 0 y 1 se toma para la concatenacion
        if (C(i)<=-0.99 || C(i)>=0.99)
            polinomio = strcat(polinomio, num2str(C(i)), 'x^', num2str(coeficiente));
        end
        
        %cuando sea el ultimo valor no se le pondrá signo
        if(coeficiente~=0)
            if (C(i+1)>=0.99)
                polinomio = strcat(polinomio, '+');
            end
        end
        coeficiente = coeficiente - 1;
    end
    
