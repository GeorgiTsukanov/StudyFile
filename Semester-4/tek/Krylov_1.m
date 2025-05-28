m = input('Введите количество строк m: ');
n= input('Введите количество столбцов n: ');

if isnan(m) || isnan(n) || m <= 0 || n <= 0 || round(m) ~= m || round(n) ~= n
    error('Ошибка: Введите целые положительные числа для размеров матрицы.');
end

A = zeros(m, n);
for i = 1:m
    for j = 1:n
        if i == j  
            A(i,j) = (2*i + 3) / (5*i - 2*j);
        else  
            A(i,j) = sqrt(i^2 + j^2);
        end
    end
end

B = randi([1 100], m, n);

A1 = max(A, [], 2);  
B1 = max(B, [], 2);  

A1_sorted = sort(A1, 'ascend');   
B1_sorted = sort(B1, 'descend');  

disp(['Размер матриц: ', num2str(m), '?', num2str(n)]);
disp(' ');

disp('Матрица A:');
disp(A);
disp(' ');

disp('Матрица B:');
disp(B);
disp(' ');

disp('Массив A1 (максимумы строк матрицы A):');
disp(A1);
disp(' ');

disp('Массив B1 (максимумы строк матрицы B):');
disp(B1);
disp(' ');

disp('Массив A1, отсортированный по возрастанию:');
disp(A1_sorted);
disp(' ');

disp('Массив B1, отсортированный по убыванию:');
disp(B1_sorted);
disp(' ');


assignin('base', 'A', A);
assignin('base', 'B', B);
assignin('base', 'A1', A1);
assignin('base', 'B1', B1);
assignin('base', 'A1_sorted', A1_sorted);
assignin('base', 'B1_sorted', B1_sorted);

disp('Все результаты сохранены в рабочей области MATLAB:');
disp('A - матрица A, созданная по заданной формуле');
disp('B - случайная матрица B');
disp('A1 - максимумы строк матрицы A');
disp('B1 - максимумы строк матрицы B');
disp('A1_sorted - A1, отсортированный по возрастанию');
disp('B1_sorted - B1, отсортированный по убыванию');