disp('<----------Ejercicio 1------------>')
syms t;
T = [10.50 29.49 42.70 60.01 75.51 91.05]; % X - variable independiente
R = [10.421 10.939 11.321 11.794 12.242 12.668]; % Y variable dependiente
n = length(T);

sumatoriaX = sum(T); % sumatoria de X
sumatoriaY = sum(R); % sumatoria de Y
multiXY=0; % Para la sumatoria de XY
X2=0; % Para la sumatoria de X^2

for i=1:n
    multiXY = multiXY+(T(i)*R(i));
    X2 = X2 + T(i)^2;
end

% Obteniendo la pendiente en mi función y=mx+b que se reescribe como r = mT+b
m = (multiXY-((sumatoriaX*sumatoriaY)/n))/(X2-(sumatoriaX^2/n));

% Obteniendo el intersecto b de la función
b = (sumatoriaY-(m*sumatoriaX))/n;

%se escribe la funcion
syms t;
r = m*t+b;

fprintf('La resistencia de la bobina que esta a 65 C: %.15f ohms\n', double(subs(r,65)));

%graficando La recta de minimos cuadradoss
fplot(matlabFunction(r), [10.50 91.05], 'g')
hold on;

% Graficar los puntos experimentales
plot(T, R, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 

% Etiquetas y t�tulo
xlabel('Temperatura (°C)');
ylabel('Resistencia (ohms)');
title('Ajuste de minimos cuadrados: Resistencia vs Temperatura');
legend('Recta ajustada', 'Datos experimentales', 'Location', 'best');
grid on;



