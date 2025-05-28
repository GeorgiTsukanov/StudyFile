root = fzero(@f1, 1);

fprintf('Корень уравнения f1(x) = 0: x = %.2f\n', root);

x = -5:0.1:5;
y = f1(x);

plot(x, y, 'b', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f(x)');
title('График f1(x) = x');
hold on;

plot(root, f1(root), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('f(x) = x', 'Корень f(x) = 0');   