function [x, iter] = newton_modifed(f, df_jacobian, x0, tol, max_iter)
    % Метод Ньютона с аппроксимацией обратной матрицы методом Шульца
    % Входные параметры:
    %   f - функция системы уравнений (возвращает вектор)
    %   df_jacobian - функция, возвращающая матрицу Якоби
    %   x0 - начальное приближение
    %   tol - допустимая погрешность
    %   max_iter - максимальное число итераций
    % Выходные параметры:
    %   x - найденное решение
    %   iter - количество выполненных итераций
    
    x = x0;
    iter = 0;
    err = inf;
    
    while err > tol && iter < max_iter
        F = f(x);
        J = df_jacobian(x);
        
        % Вычисление обратной матрицы Якоби методом Шульца
        Jinv = schulz_inv(J, 1e-3, 50); % tol_inv и max_iter_inv можно настроить
        
        dx = Jinv * (-F);
        x_new = x + dx;
        
        err = norm(x_new - x);
        x = x_new;
        iter = iter + 1;
        
        fprintf('Итерация %d: ошибка = %e\n', iter, err);
    end
    
    if iter == max_iter
        warning('Достигнуто максимальное число итераций');
    end
end
