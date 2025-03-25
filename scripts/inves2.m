%Ejercicio 2
syms x;
% Valores de la Diferencia de Presión y Velocidad Promedio
DP = [30.0 35.5 50.5 75.0 92.0 105.0 115.0 130.0 153.5 180.0 199.5];
V =[3.83 4.17 4.97 6.06 6.71 7.17 7.51 7.98 8.67 9.39 9.89];
f = log(x);
val = 5.5; % valor al que queremos aproximar
%Calculamos las xi y yi
xi_lndp = double(subs(f,DP));
yi_lnv = double(subs(f,V));
n= length(DP);

  for i=1:n
    %Calculamos las xi*yi
    xiyi(i)= xi_lndp(i)*yi_lnv(i);
    %Calculamos las xi^2
    xi2(i) = (xi_lndp(i))^2;
  end
%Calculamos las sumatorias
sum_xiyi = sum(xiyi);
sum_xi =sum(xi_lndp);
sum_yi =sum(yi_lnv);
sum_xi2 =sum(xi2);


%Calculamos b y a
b = ((n)*(sum_xiyi)-(sum_xi)*(sum_yi))/((n)*(sum_xi2)-(sum_xi)^2);
a = ((sum_yi)-(b)*(sum_xi))/(n);
alpha= exp(a); betha = b;
%Nuestra funcion nos queda como:
disp('El modelo potencial nos queda: ');
modelo = alpha*(x^(betha));
pretty(vpa(modelo, 5));
estimacion = double(subs(modelo, val));
fprintf('\n\nEl valor aproximado de la velocidad del fluido en una caída de presión de %.1f mmHg es: %.15f ft/s\n' , val, estimacion)

% Graficando
plot(DP, V, '*r')
hold on
grid on
plot(val, estimacion, '*g')
ezplot(modelo, [0 200])
legend('Valores iniciales de DP y V', 'Punto de estimación', 'Modelo de aproximación')
title('Problema 2')
ylabel('Velocidad promedio (ft/s)')
xlabel('Caída de presión (mm Hg)')
