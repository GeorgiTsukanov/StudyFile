import sympy as sp
import numpy as np

def initial_guess(variables, bounds=(-10, 10)):
    return {var: np.random.uniform(bounds[0], bounds[1]) for var in variables}

def inverse_matrix_schulz(
    matrix: np.ndarray,
    iterations: int = 5,
    alpha = None
):
    if alpha is None:
        alpha = 1.0 / (np.linalg.norm(matrix, ord=2) ** 2)  # Спектральная норма
    
    G = alpha * matrix.T
    for _ in range(iterations):
        G = 2 * G - G @ matrix @ G
    
    return G


def newton_method(
    equations,
    variables,
    initial_guess,
    max_iter: int = 50,
    schulz_iter: int = 5,
    tol: float = 1e-6,
    alpha = None,
    verbose: bool = False
):
    if isinstance(initial_guess, (list, np.ndarray)):
        initial_guess = {var: val for var, val in zip(variables, initial_guess)}
    
    J = sp.Matrix(equations).jacobian(variables)
    F = sp.Matrix(equations)
    
    F_func = sp.lambdify(variables, F, "numpy")
    J_func = sp.lambdify(variables, J, "numpy")
    
    x_current = initial_guess.copy()
    
    for k in range(max_iter):
        args = [x_current[var] for var in variables]
        F_val = np.array(F_func(*args), dtype=float).flatten()
        J_val = np.array(J_func(*args), dtype=float)
        
        J_inv = inverse_matrix_schulz(J_val, iterations=schulz_iter, alpha=alpha)
        delta = J_inv @ F_val
        
        x_next = {}
        for i, var in enumerate(variables):
            x_next[var] = x_current[var] - delta[i]
            
        error = np.linalg.norm([x_next[var] - x_current[var] for var in variables])
        
        if verbose:
            print(f"итерация {k}: x = {x_next}, погрешность = {error:.4e}")
        
        if error < tol:
            break
        
        x_current = x_next
    
    return x_current


if __name__ == "__main__":
    var_str = input("Введите переменные (через пробел, например, x y): ").split()
    variables = sp.symbols(var_str)
    
    equations = []
    for i in range(len(variables)):
        while True:
            try:
                eq_str = input(f"Уравнение {i+1}: ")
                equations.append(sp.sympify(eq_str))
                break
            except (sp.SympifyError, SyntaxError):
                print("Ошибка: некорректный ввод. Попробуйте снова.")
    
    
    solution = newton_method(
        equations,
        variables,
        initial_guess(variables),
        verbose=True
    )
    
    print("\nРезультат:")
    for var, val in solution.items():
        print(f"{var} = {val:.6f}")
