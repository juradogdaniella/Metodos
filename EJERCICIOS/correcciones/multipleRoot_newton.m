clc; clear; close all;
% Modified Newton-Raphson Method for f(x) = x^3 - 5x^2 + 7x - 3 = 0

f = @(x) x^3 - 5*x^2 + 7*x - 3;
df = @(x) 3*x^2 - 10*x + 7;
d2f = @(x) 6*x - 10;

x0 = 0;
tol = 1e-6;
max_iter = 100;

x = x0;
iter = 0;
error_approx = 100;

fprintf('Iteration\t x_i\t\t f(x_i)\t\t f''(x_i)\t x_{i+1}\t\t Approx. Relative Error (%%)\n');
fprintf('------------------------------------------------------------------------------------\n');

while error_approx > tol && iter < max_iter
    fx = f(x);
    dfx = df(x);
    d2fx = d2f(x);
    
    denominator = dfx^2 - fx * d2fx;
    if denominator == 0
        fprintf('Denominador es 0. No se puede continuar con el metodo.\n');
        break;
    end
    
    x_new = x - (fx * dfx) / denominator;
    error_approx = abs((x_new - x) / x_new) * 100;
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, fx, dfx, x_new, error_approx);
    
    x = x_new;
    iter = iter + 1;
end

fprintf('\nRaiz aproximada: %.6f\n', x);
fprintf('Iteraciones: %d\n', iter);