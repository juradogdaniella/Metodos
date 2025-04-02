clc; clear; close all;
% Fixed-Point Iteration Method for Systems of Nonlinear Equations

g1 = @(x, y) sqrt(10 - x*y);
g2 = @(x, y) sqrt((57 - y) / (3*x));

x0 = 0.5;
y0 = 0.5;
tol = 1e-6;
max_iter = 100;

x = x0;
y = y0;
iter = 0;
error_approx = 100;

fprintf('Iteracion\t x_i\t\t y_i\t\t x_{i+1}\t\t y_{i+1}\t\t Aprox. Error Relativo (%%)\n');
fprintf('----------------------------------------------------------------------------------------\n');

while error_approx > tol && iter < max_iter
    x_new = g1(x, y);
    y_new = g2(x, y);
    
    error_approx = max(abs((x_new - x) / x_new), abs((y_new - y) / y_new)) * 100;
    
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, y, x_new, y_new, error_approx);
    
    x = x_new;
    y = y_new;
    iter = iter + 1;
end

fprintf('\nRaiz aproximada: x = %.6f, y = %.6f\n', x, y);
fprintf('Iteraciones: %d\n', iter);
