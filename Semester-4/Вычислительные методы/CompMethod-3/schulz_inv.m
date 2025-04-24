function Jinv = schulz_inv(A, tol, max_iter)
    % Метод Шульца для вычисления обратной матрицы
    % A - входная матрица
    % tol - допустимая погрешность
    % max_iter - максимальное число итераций
    
    n = size(A, 1);
    X = A' / (norm(A, 1) * norm(A, inf)); % Начальное приближение
    
    for k = 1:max_iter
        X_new = X * (2 * eye(n) - A * X);
        err = norm(X_new - X, 'fro');
        X = X_new;
        
        if err < tol
            break;
        end
    end
    
    Jinv = X;
end
