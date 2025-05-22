import numpy as np
import sympy as sp
from sympy.utilities.lambdify import lambdify

def f(t):
    return t**2

def compute_integral(f, a, x, n=1000):
    if x < a:
        t_values = np.linspace(x, a, n)
        integral = -np.sum(f(t_values[:-1])) * (a - x) / n #[:-1] срез все элементы кроме последнего
    else:
        t_values = np.linspace(a, x, n)
        integral = np.sum(f(t_values[:-1])) * (x - a) / n
    return integral

def newton_method(f, a, b, x0, tol=1e-6, max_iter=100):
    x = x0
    for _ in range(max_iter):
        F_x = compute_integral(f, a, x) - b
        df_x = f(x)
        if abs(df_x) < tol:
            break
        delta_x = F_x / df_x
        x -= delta_x
        if abs(delta_x) < tol:
            break
    return x

def find_roots(f, a, b, search_range=(-10, 10), step=0.5):
    roots = []
    x_values = np.arange(search_range[0], search_range[1] + step, step)
    
    for i in range(len(x_values) - 1):
        x1 = x_values[i]
        x2 = x_values[i + 1]
        F1 = compute_integral(f, a, x1) - b
        F2 = compute_integral(f, a, x2) - b
        if F1 * F2 < 0:
            x0 = (x1 + x2) / 2
            root = newton_method(f, a, b, x0)
            roots.append(root)
    
    unique_roots = list(set(np.round(roots, decimals=6)))
    return sorted(unique_roots)

if __name__ == '__main__':
    try:
        x = sp.symbols('x')
        expr = input("Введите f(x): ")
        f_sympy = sp.sympify(expr)  
        f = lambdify(x, f_sympy, 'numpy')
        a = int(input("Введите a: "))
        b = int(input("Введите b: "))
        roots = find_roots(f, a, b, search_range=(-5, 5), step=0.5)
        print('Корни нелинейного уравнения:')
        for i in roots:
            print(i)
    except (sp.SympifyError, SyntaxError):
        print("Ошибка: некорректный ввод. Попробуйте снова.")
    
