clc; clear; close all;

%% Definir la función f(x) y su derivada
f = @(x) exp(-x) - x;    % Función dada
df = @(x) -exp(-x) - 1;  % Derivada de la función

%% Parámetros
tol = 1e-6; % Tolerancia
x0 = 0;     % Valor inicial
max_iter = 100; % Máximo de iteraciones

%% Método de Punto Fijo
fprintf('Método de Punto Fijo:\n');
g = @(x) exp(-x); % Función de iteración
x_punto_fijo = x0;
for iter = 1:max_iter
    x_new = g(x_punto_fijo);
    fprintf('Iteración %d: x = %.6f\n', iter, x_new);
    if abs(x_new - x_punto_fijo) < tol
        break;
    end
    x_punto_fijo = x_new;
end
fprintf('Solución por Punto Fijo: x = %.6f\n\n', x_punto_fijo);

%% Método de Newton-Raphson
fprintf('Método de Newton-Raphson:\n');
x_newton = x0;
for iter = 1:max_iter
    x_new = x_newton - f(x_newton) / df(x_newton);
    fprintf('Iteración %d: x = %.6f\n', iter, x_new);
    if abs(x_new - x_newton) < tol
        break;
    end
    x_newton = x_new;
end
fprintf('Solución por Newton-Raphson: x = %.6f\n', x_newton);
