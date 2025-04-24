function [f, df] = user_interface()
	n = input('Введите количество уравнений');
	f_sym = [];

	for i = 1:n
		f_str = input(['Введите уравнение ', i, ' : '], 's');
		f_sym(i) = str2sym(f_str);	
	end

	x0 = [1; 1];
	tol = 1e-6;
	max_iter = 100;

	x = sym('x', [n, 1]);
	f = matlabFunction(f_sym, 'Vars', {x});
	df_jacobian = matlabFunction(jacobian(f_sym, x), 'Vars', {x});

	[x_otvet, iter] = newton_modifed(f, df_jacobian, x0, tol, max_iter);
	disp(['Решение: ', x_otvet, ' Кол-во итераций: ', iter]);
end	
