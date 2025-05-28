
start = [2, 2]; 
[min_point, min_value] = fminsearch(@f2, start);

fprintf('Минимум f2(x1,x2): %.2f в точке (%.2f, %.2f)\n', min_value, min_point(1), min_point(2));

[x1, x2] = meshgrid(-5:0.1:5, -5:0.1:5);
z = 2 * abs(x1) + 3 * abs(x2);

surf(x1, x2, z);
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
title('График f2(x1,x2) = 7*(x1)^2+3*(x2)^2;');
shading interp;
colorbar;
hold on;


plot3(min_point(1), min_point(2), min_value, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');