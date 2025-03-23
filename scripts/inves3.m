%Ejercicio 2
syms x;
X = [2.5 3.5 5 6 7.5 10 12.5 15 17.5 20];
Y = [13 11 8.5 8.2 7 6.2 5.2 4.8 4.6 4.3];
f = log(x);
val = 9;
x1 = 2.5:1:20;
%Calculamos las xi y yi
xi_lnx = double(subs(f,X));
yi_lny = double(subs(f,Y));
n= length(X);
%Calculamos las xi*yi
for i=1:n
    xiyi(i)= xi_lnx(i)*yi_lny(i);
end

%Calculamos las xi^2
for i=1:n
    xi2(i) = (xi_lnx(i))^2;
end
%Calculamos las sumatorias
sum_xiyi = sum(xiyi);
sum_xi =sum(xi_lnx);
sum_yi =sum(yi_lny);
sum_xi2 =sum(xi2);

%Calculamos b y a
b = ((n)*(sum_xiyi)-(sum_xi)*(sum_yi))/((n)*(sum_xi2)-(sum_xi)^2);
a = ((sum_yi)-(b)*(sum_xi))/(n);
alpha= exp(a); betha = b;
%Nuestra funcion nos queda como:
disp('El modelo potencial nos queda: ');
modelo = alpha*(x^(betha));
pretty(vpa(modelo, 5))
fprintf('El valor aproximado con el modelo potencial es: %.15f' , double(subs(modelo, val)))
%Graficando la funcion de aproximacion y los datos
plot(X,Y,'r')
hold on
axis auto
fplot(modelo, [2.5 20], 'g')