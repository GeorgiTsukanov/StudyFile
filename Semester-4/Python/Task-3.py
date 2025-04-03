#1
'''
array = [i for i in range(10)]
for i in array:
    if (i % 2 == 0):
        print(i)
'''

#2
'''
array = list(map(int, input().split()))
minEl = array[0]
for i in array:
    if (minEl > i):
        minEl = i
maxEl = array[0]
for i in array:
    if (maxEl < i):
        maxEl = i

minIndex = array.index(minEl)
maxIndex = array.index(maxEl)

array[minIndex] = maxEl
array[maxIndex] = minEl

print(array)
'''

#3
'''
array = [i for i in range(10)]
print(sum(array)/len(array))
'''

#4
'''
array = [i*2 for i in range(1, 6)]
maxEl = max(array)
minEl = min(array)
for i in range(len(array)):
    array[i] = (array[i] - minEl)/(maxEl-minEl)
print(array)
'''

#5
'''
n = int(input())
fib = [0, 1]
for i in range(2, n + 1):
    fib.append(fib[i-1] + fib[i-2])

print(n, "число в последовательности Фибоначчи: ", fib[n])
'''

#6
'''
numbers = [10, 20, 45, 30, 45, 50]

if 45 in numbers:
    index = numbers.index(45)
    numbers[index] = 123

print(numbers)
'''

#7
'''
numbers = [1, 2, 3, 4, 5]
numbers = [i**2 for i in numbers]
print(numbers)
'''

#8
'''
numbers = [10, 20, 30, 20, 40]
numbers = [x for x in numbers if x != 20]
'''

#10
'''
s = input()
half = (len(s) + 1) // 2
new_s = s[half:] + s[:half]
print(new_s)
'''
