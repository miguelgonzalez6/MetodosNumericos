function x = Montante( a )
%Montante Summary of this function goes here
%   Detailed explanation goes here

    %Sacar los datos requeridos
    [m,n] = size(a);

        pivote=1;
        for k=1:m
            for i=1:m
                if i~=k
                    for j=n:-1:1
                        a(i,j)=(a(k,k)*a(i,j)-a(i,k)*a(k,j))/pivote;
                    end
                end
            end
            pivote=a(k,k);
        end
        det=a(1,1);
        for i=1:m
            for j=1:m
                if i==j
                a(i,j)=a(i,j)/det;
                a(i,n)=a(i,n)/det;
                end
            end
        end
        f = cell(m, 1);
        for i=1:m
        x(i)=a(i,n);
        f{i} = strcat('x', num2str(i));
        f{i} = strcat(f{i},'= ');
        end








