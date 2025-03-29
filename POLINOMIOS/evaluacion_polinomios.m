clc; clear; close all;

function a_normalized = normalize_coefficients(a, grade, order)
    % Normalize coefficients and adjust order
    % a: vector of coefficients
    % grade: desired degree of the polynomial
    % order: 'descend' (default) or 'ascend'

    if nargin < 3
        order = 'descend'; % Default order (MATLAB standard)
    end

    % Ensure the vector has the correct length
    if length(a) < grade + 1
        padding = zeros(1, grade + 1 - length(a));
        if strcmpi(order, 'descend')
            a_normalized = [a, padding]; % Fill at the end (for descending order)
        else
            a_normalized = [padding, a]; % Fill at the beginning (for ascending order)
        end
    elseif length(a) > grade + 1
        a_normalized = a(1:grade + 1); % Truncate
    else
        a_normalized = a;
    end

    % Reorder if necessary
    if strcmpi(order, 'ascend')
        a_normalized = fliplr(a_normalized); % Convert to descending order
    end
end

function resultStandard = evaluate_polynomial_standard(a, x)
    % Evaluate a polynomial in its standard form.
    % a: Vector of coefficients [a0, a1, ..., an].
    % x: Value at which the polynomial is evaluated.

    n = length(a) - 1;  % Degree of the polynomial
    resultStandard = 0;      % Initialize the result

    for i = 0:n
        resultStandard = resultStandard + a(i+1) * x^i;  % Sum each term
    end
end

function resultNested = evaluate_polynomial_nested(a, x)
    % Evaluate a polynomial using the nested method (nested form).
    % a: Vector of coefficients [a0, a1, ..., an].
    % x: Value at which the polynomial is evaluated.

    n = length(a) - 1;  % Degree of the polynomial
    resultNested = a(n+1); % Initialize with the highest degree coefficient

    for i = n:-1:1
        resultNested = resultNested * x + a(i);  % Apply the nested method
    end
end

% Coefficients of the polynomial P(x) = 2x^3 - 5x^2 + 3x - 7
a = [-7, 3, -5, 2];  % a0, a1, a2, a3
grade = 3;
a_normalized = normalize_coefficients(a, grade, 'ascend');

% Value of x
x = 2;

% Evaluate using the standard form
resultStandard = evaluate_polynomial_standard(a_normalized, x);
disp('Resultado (forma estándar):');
disp(resultStandard);

% Evaluate using the nested form
resultNested = evaluate_polynomial_nested(a_normalized, x);
disp('Resultado (forma anidada):');
disp(resultNested);