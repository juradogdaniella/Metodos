clc; clear; close all;
% Newton-Raphson Method for Systems of Nonlinear Equations

u = @(x, y) x^2 + x*y - 10;
v = @(x, y) y + 3*x*y^2 - 57;

J = @(x, y) [2*x + y, x; 3*y^2, 1 + 6*x*y];

x0 = 1;
y0 = 3;
tol = 1e-6;
max_iter = 100;

x = x0;
y = y0;
iter = 0;
error_approx = 100;

fprintf('Iteracion\t x_i\t\t y_i\t\t u(x_i, y_i)\t v(x_i, y_i)\t x_{i+1}\t\t y_{i+1}\t\t Aprox. Error Relativo (%%)\n');
fprintf('----------------------------------------------------------------------------------------------------\n');

while error_approx > tol && iter < max_iter
    u_val = u(x, y);
    v_val = v(x, y);
    J_val = J(x, y);
    
    J_inv = inv(J_val);
    
    x_new = x - (J_inv(1,1)*u_val + J_inv(1,2)*v_val);
    y_new = y - (J_inv(2,1)*u_val + J_inv(2,2)*v_val);
    
    error_approx = max(abs((x_new - x) / x_new), abs((y_new - y) / y_new)) * 100;
    
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, y, u_val, v_val, x_new, y_new, error_approx);
    
    x = x_new;
    y = y_new;
    iter = iter + 1;
end

fprintf('\nRaiz aproximada: x = %.6f, y = %.6f\n', x, y);
fprintf('Iteraciones: %d\n', iter);
