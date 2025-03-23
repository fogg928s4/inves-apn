%% ejercicio 4 - trabajo de investigacion
% este ejercico se resuelve por el mÃ©todo de parabola de minimos cuadrados

%% valores iniciales de velocidad y distancia

X = [20, 30, 40, 50, 60, 70];

Y = [54, 90, 138, 206, 292, 396];
t = 55;
suma_X = 0; suma_X2 = 0;
suma_X3 = 0; suma_X4 = 0;
suma_Y = 0; suma_XY = 0;
suma_X2Y = 0;

N= length(X);
        for i = 1: N
            suma_X = suma_X + X(i);
            suma_X2 = suma_X2 + X(i) ^ 2;
            suma_X3 = suma_X3 + X(i) ^ 3;
            suma_X4 = suma_X4 + X(i) ^ 4;
            suma_Y = suma_Y + Y(i);
            suma_XY = suma_XY + X(i) * Y(i);
            suma_X2Y = suma_X2Y + X(i) ^ 2 * Y(i);
        end
%% matrices y submatriz

M = [ N suma_X suma_X2; suma_X suma_X2 suma_X3; suma_X2 suma_X3 suma_X4];
subM = [suma_Y suma_XY suma_X2Y];

%% encontrando los valores
for i = 1:3
    Maux = M; %matriz auxiliar copia la original
    Maux(:,i) = subM; % reemplaza los valores de la columna
    a(i) = det(Maux) / det(M); % denominador del auxiliar con el de la original
    %el arreglo a son los coeficientes de cada a
end
% polinomio
syms x;
P = a(1) + a(2) * x  + a(3) * x ^ 2;
v1 =  55; v2 = 75;
aprox1 = subs(P, v1);
aprox2 = subs(P, v2);
% estimacion
fprintf('El valor de aproximado para %d es de: %.9f\n', v1, double(aprox1));
fprintf('El valor de aproximado para %d es de: %.9f\n', v2, double(aprox2));
%% Grafica
ezplot(P, [10 80])
grid on
hold on
ylabel('Distancia de frenado (m)')
xlabel('Velocidad (m/s)')
axis([10 80 0 500])
plot(X,Y, '*r')
legend('Parábola de estimación', 'Valores iniciales')
title('Parábola de mínimos cuadrados')