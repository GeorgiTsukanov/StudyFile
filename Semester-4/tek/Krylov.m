% 2 zadanie
figure;
subplot(2, 3, 1);
x = linspace(-5, 5, 100);
y1 = sin(x) + exp(x);
plot(x, y1, 'b', 'LineWidth', 2);
title('y1 = sin(x) + exp(x)');
xlabel('x');
ylabel('y');
grid on;

subplot(2, 3, 2);
y2 = sin(x) + x.^2; 
plot(x, y2, 'r', 'LineWidth', 2);
title('y2 = sin(x) + x^2');
xlabel('x');
ylabel('y');
grid on;

subplot(2, 3, 3);
y3 = sin(x) + x;
plot(x, y3, 'g', 'LineWidth', 2);
title('y3 = sin(x) + x');
xlabel('x');
ylabel('y');
grid on;

subplot(2, 3, 6);
y4 = sin(x) + abs(x);
plot(x, y4, 'y', 'LineWidth', 2);
title('y4 = sin(x) + abs(x)');
xlabel('x');
ylabel('y');
grid on;

