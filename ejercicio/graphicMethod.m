% Define the function
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Define the interval
x = linspace(0, 4, 1000);

% Plot the function
figure;
plot(x, f(x));
grid on;
xlabel('x');
ylabel('f(x)');
title('Graphical Method: f(x) = x.^3 - 6*x.^2 + 11*x - 6');

% Highlight the x-axis
hold on;
plot(x, zeros(size(x)), 'k--');
hold off;