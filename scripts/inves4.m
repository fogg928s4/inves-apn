%% ejercicio 4 - trabajo de investigacion
% este ejercico se resuelve por el método de parabola de minimos cuadrados

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
%% Creacion de la matriz M y submatriz subM
M = [ N suma_X suma_X2; suma_X suma_X2 suma_X3; suma_X2 suma_X3 suma_X4];
subM = [suma_Y suma_XY suma_X2Y];

%% encontrando los valores
for i = 1:3
    Maux = M; %matriz auxiliar copia la original
    Maux(:,i) = subM; % reemplaza los valores de la columna
    a(i) = det(Maux) / det(M); % denominador del auxiliar con el de la original
end
% Armando el polinomio con los valores de a encontrados
syms x;
P = a(1) + a(2) * x  + a(3) * x ^ 2;
aprox = subs(P, t);
% estimacion
fprintf('El valor de aproximado para %d es de: %.9f\n', t, double(aprox));