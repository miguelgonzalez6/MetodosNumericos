
function x = crammer(a)
%CRAMER	Solve linear system by Cramer's Rule.
%   Detailed explanation goes here

    %Sacar los datos requeridos
    [m,n] = size(a);
        for j=1:m-1
            for z=2:m
                if a(j,j)==0
                    t=a(j,:);a(j,:)=a(z,:);
                 a(z,:)=t;
                end
            end
            for i=j+1:m
                a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
            end
        end
        x=zeros(1,m);
        for s=m:-1:1
            c=0;
            for k=2:m
            c=c+a(s,k)*x(k);
            end
            x(s)=(a(s,n)-c)/a(s,s);
        end
        f = cell(m, 1);
        for i=1:m
        f{i} = strcat('x', num2str(i));
        f{i} = strcat(f{i},'= ');
        end
