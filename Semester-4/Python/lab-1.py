# 1
'''
b1 = int(input())
q = int(input())
n = int(input())
print(b1*q**(n-1))
'''

#2
'''
a = int(input())
b = int(input())
n = int(input())

print("руб: ", (a * n + (b * n)//100), "\nкоп: ", ((b*n)%100))
'''

#3
'''
x = int(input())
h = int(input())
m = int(input())

print((h+(m+x)//60)%24, ":", (m+x)%60)
'''

# 4
'''
a = int(input())
print(a + 2 - a%2)
print(a + a%2 + (int(not(a%2))*2))
'''

#5
'''
n = int(input())
if (n == 1):
    print(0)
elif (n % 2 == 0):
    print(n / 2)
elif (n % 2 == 1):
    print(n)
'''

#6
'''
m = int(input())
print(m//2 + m%2)
'''

#7
'''
def minElem(a):
    minEl = a[0]
    for i in a:
        if (minEl > i):
            minEl = a[i]
    return minEl

m = int(input())
n = int(input())
l = int(input())
k = int(input())

if (n < m):
    print(minElem([l, k, m-k, n-l]))
else:
    print(minELem([l, k, n-k, m-l]))
'''

#8
'''
a = int(input())
b = int(input())
for i in range(a - a%2 + 1, b + b%2, 2):
    print(i)
'''

#9
'''
n = int(input())
x = 1
r = 0
for i in range(n):
    x += x * i
    r += x
print(x)
'''
