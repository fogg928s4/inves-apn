%Ejercicio 3
format longG
syms x;
X = [2.5 3.5 5 6 7.5 10 12.5 15 17.5 20];
Y = [13 11 8.5 8.2 7 6.2 5.2 4.8 4.6 4.3];
val = 9; % valor al que haremos la estimación
%x1 = 2.5:1:20;

%Calculamos las xi y yi
f = log(x); % funcion logaritmo natural
xi_lnx = double(subs(f,X));
yi_lny = double(subs(f,Y));
n= length(X);

for i=1:n
    %Calculamos las xi*yi
    xiyi(i)= xi_lnx(i)*yi_lny(i);
    %Calculamos las xi^2
    xi2(i) = (xi_lnx(i))^2;
end

%Calculamos las sumatorias
sum_xiyi = sum(xiyi); % sumatoria de xy
sum_xi =sum(xi_lnx); % sumatoria de xi
sum_yi =sum(yi_lny); % sumatoria yi
sum_xi2 =sum(xi2); % sumatoria xi^2

%Calculamos b y a
b = ((n)*(sum_xiyi) - (sum_xi) * (sum_yi))/((n)*(sum_xi2)-(sum_xi)^2);
a = ((sum_yi)-(b) * (sum_xi))/(n);
alpha= exp(a); beta = b;

%Nuestra funcion nos queda como:
disp('El modelo potencial nos queda: ');
modelo = alpha*(x^(beta));
pretty(vpa(modelo, 5))


fprintf('El valor aproximado con el modelo potencial es: %.15f\n' , double(subs(modelo, val)))
%Graficando la funcion de aproximacion y los datos
plot(X,Y,'*r')
hold on
grid on
axis auto
ezplot(modelo, [2.5 20])
legend('Puntos iniciales', 'Modelo potencial')
title('Problema 3')