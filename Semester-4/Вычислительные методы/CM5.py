import numpy as np
import matplotlib.pyplot as plt
import sympy as sp
from sympy.utilities.lambdify import lambdify

def adams_moulton_2step(f, t0, y0, h, n):
    t_vals = np.zeros(n+1)
    y_vals = np.zeros(n+1)
    
    t_vals[0] = t0
    y_vals[0] = y0
    
    # Первый шаг методом Эйлера
    t_vals[1] = t0 + h
    y_vals[1] = y0 + h * f(t0, y0)
    
    for i in range(1, n):
        t_vals[i+1] = t_vals[i] + h
        y_pred = y_vals[i] + h/2 * (3*f(t_vals[i], y_vals[i]) - f(t_vals[i-1], y_vals[i-1]))
        y_vals[i+1] = y_vals[i] + h/2 * (f(t_vals[i+1], y_pred) + f(t_vals[i], y_vals[i]))
    
    return t_vals, y_vals

t_sym = sp.symbols('t')
y_sym = sp.symbols('y')

print("Введите дифференциальное уравнение в виде y'(t) = f(t, y(t))")
print("Например, для y' = t + y введите: t + y")
eq_input = input("Введите уравнение: ")
f_expr = sp.sympify(eq_input)

f_lambda = lambdify((t_sym, y_sym), f_expr, modules='numpy')

t0 = float(input("Введите начальное значение t0: "))
y0 = float(input("Введите начальное значение y0: "))

t_end = float(input("Введите конечное значение t: "))
h = float(input("Введите шаг h: "))

# Аналитическое решение (если возможно)
try:
    y_func = sp.Function('y')(t_sym)
    ode = sp.Eq(y_func.diff(t_sym), f_expr.subs(y_sym, y_func))
    analytic_sol = sp.dsolve(ode, y_func, ics={y_func.subs(t_sym, t0): y0})
    print(f"\nАналитическое решение: {analytic_sol.rhs}")
    y_exact = lambdify(t_sym, analytic_sol.rhs, modules='numpy')
except Exception as e:
    print(f"\nНе удалось найти аналитическое решение: {e}")
    y_exact = None


n = int((t_end - t0) / h)
t_h, y_h = adams_moulton_2step(f_lambda, t0, y0, h, n)
n2 = int((t_end - t0) / (h/2))
t_h2, y_h2 = adams_moulton_2step(f_lambda, t0, y0, h/2, n2)

# Вывод результатов и графики
plt.figure(figsize=(12, 6))

# График численных решений
plt.plot(t_h, y_h, 'bo-', label=f'Численное решение (h={h})', markersize=4)
plt.plot(t_h2, y_h2, 'gx-', label=f'Численное решение (h={h/2})', markersize=4)

if y_exact is not None:
    t_exact = np.linspace(t0, t_end, 100)
    plt.plot(t_exact, y_exact(t_exact), 'r-', label='Точное решение')

plt.xlabel('t')
plt.ylabel('y(t)')
plt.legend()
plt.grid(True)
plt.title("Сравнение численных и точного решений")
plt.show()

# Оценка погрешности и порядка точности
if y_exact is not None:
    error_h = np.abs(y_h - y_exact(t_h))
    error_h2 = np.abs(y_h2[::2] - y_exact(t_h)) 
    
    if len(error_h) > 1 and len(error_h2) > 1:
        order = np.log(error_h[1:] / error_h2[1:]) / np.log(2)
        mean_order = np.mean(order[~np.isinf(order) & ~np.isnan(order)])
        print(f"\nСредний оцененный порядок точности метода: {mean_order:.4f}")
        print("\nСравнение решений в точках:")
        
    print(" t       | Численное (h) | Численное (h/2) | Точное      | Ошибка (h) | Ошибка (h/2)")
    print("---------|---------------|-----------------|-------------|------------|-------------")
    for i in range(0, len(t_h), len(t_h)//10):
        print(f"{t_h[i]:<8.3f}| {y_h[i]:<14.6f}| {y_h2[i*2]:<15.6f}| {y_exact(t_h[i]):<11.6f}| {error_h[i]:<10.6f}| {error_h2[i]:<11.6f}")
else:
    print("\nТочное решение недоступно для сравнения")
