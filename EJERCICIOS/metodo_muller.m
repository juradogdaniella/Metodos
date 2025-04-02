function raiz = muller(f, x0, x1, x2, tol, max_iter)
    fprintf('Iter\t   x0\t        x1\t        x2\t        x3\t        f(x3)\n');
    fprintf('-----------------------------------------------------------------------------\n');

    for iter = 1:max_iter
        % Evaluar la función en los tres puntos
        f0 = f(x0);
        f1 = f(x1);
        f2 = f(x2);

        % Calcular diferencias divididas
        h0 = x1 - x0;
        h1 = x2 - x1;
        delta0 = (f1 - f0) / h0;
        delta1 = (f2 - f1) / h1;

        % Calcular coeficientes del polinomio cuadrático
        a = (delta1 - delta0) / (h1 + h0);
        b = a * h1 + delta1;
        c = f2;

        % Calcular el discriminante y elegir el signo adecuado
        discriminante = sqrt(b^2 - 4 * a * c);
        if abs(b + discriminante) > abs(b - discriminante)
            x3 = x2 - (2 * c) / (b + discriminante);
        else
            x3 = x2 - (2 * c) / (b - discriminante);
        end

        % Imprimir los valores en la iteración actual
        fprintf('%2d\t%.6f\t%.6f\t%.6f\t%.6f\t%.6e\n', iter, x0, x1, x2, x3, f(x3));

        % Verificar convergencia
        if abs(f(x3)) < tol
            raiz = x3;
            fprintf('Raíz encontrada: %.6f en %d iteraciones\n', raiz, iter);
            return;
        end

        % Actualizar puntos para la siguiente iteración
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end

    % Si no se encuentra la raíz dentro del número máximo de iteraciones
    fprintf('No se alcanzó convergencia en %d iteraciones\n', max_iter);
    raiz = NaN;
end

% Definir la función
f = @(x) x.^3 - 13*x - 12;

% Parámetros iniciales
x0 = 4.5;
x1 = 5.5;
x2 = 5;
tol = 1e-6;
max_iter = 100;

% Llamar a la función
raiz = muller(f, x0, x1, x2, tol, max_iter);