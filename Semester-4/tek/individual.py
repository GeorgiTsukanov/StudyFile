import re
import numpy as np
import matplotlib as mp
import matplotlib.pyplot as plt


# 11
def f1():
    print("№1")
    vector = np.random.randint(0, 100, 20)
    print(f"Вектор: {vector}")

    max_value = np.max(vector)
    max_index = np.argmax(vector)
    print(f"Максимальное значение: {max_value}, его индекс: {max_index}")
    print("\n--------------------------------\n")

def f2():
    print("№2")
    matrix = np.random.randint(0, 10, (3, 4))
    print(f"Матрица:\n {matrix}")

    row_sum = np.sum(matrix, axis=1)
    print(f"Суммы строк: {row_sum}")

    max_row_index = np.argmax(row_sum)
    print(f"Индекс строки с максимальной суммой: {max_row_index}")
    print("\n--------------------------------\n")

def f3():
    values = [8000, 7000, 2000, 7000]
    labels = ["ЖКХ", "Продукты", "Транспорт", "Прочее"]

    plt.figure(figsize=(8, 6))
    plt.pie(values, labels=labels)
    plt.title('Распределение семейного бюджета')
    plt.axis('equal')
    plt.show()

def f4():
    ages = np.random.normal(45, 15, 100)
    ages = np.clip(ages, 0, 100)

    plt.figure(figsize=(10, 6))
    plt.hist(ages, bins=20, color='skyblue', edgecolor='black')
    plt.title('Распределение пациентов по возрасту')
    plt.xlabel('Возраст')
    plt.ylabel('Количество пациентов')
    plt.grid()
    plt.show()

def f5():
    months = np.arange(1, 13)
    farm1 = np.random.normal(5000, 500, 12)
    farm2 = np.random.normal(7000, 800, 12)
    farm3 = np.random.normal(4000, 400, 12)

    plt.figure(figsize=(12, 6))
    plt.plot(months, farm1, 'r', label='Ферма 1')
    plt.plot(months, farm2, 'g--', label='Ферма 2')
    plt.plot(months, farm3, 'b:', label='Ферма 3')

    plt.title('Ежемесячные расходы на электроэнергию')
    plt.xlabel('Месяц')
    plt.ylabel('Расходы, руб.')
    plt.legend()
    plt.grid()
    plt.xticks(months)
    plt.show()
    
#регулярные выражения

def f6():
    string = 'Пам BAm S ПАРА,'
    r = r'\b[А-ЯЁA-Z]+\b'
    print(re.findall(r, string))

f3()

