#1
m1 = set(input().split())
m2 = set(input().split())

print(list(m1.difference(m2)))


#2
'''
m1 = set(input().split())
m2 = set(input().split())

print(m1.union(m2))
print(m1.intersection(m2))
print(m1.difference(m2))
print(m1.symmetric_difference(m2))
'''

#3
'''
n = input().split()
print(len(set(n)))
'''

#4
'''
n1 = input().split()
n2 = input().split()
print(len(set(n1)&set(n2)))
'''

#5
'''
n1 = input().split()
n2 = input().split()
print(sorted(set(n1)&set(n2)))
'''

#6
'''
n = list(map(int, input().split()))
m = set()

for num in n:
    if num in m:
        print("YES")
    else:
        print("NO")
        m.add(num)
'''

#7
n, m = map(int, input().split())
anya = set(int(input()) for i in range(n))
borya = set(int(input()) for i in range(m))

common = sorted(anya & borya)
only_anya = sorted(anya - borya)
only_borya = sorted(borya - anya)

print(len(common))
print(' '.join(map(str, common)))
print(len(only_anya))
print(' '.join(map(str, only_anya)))
print(len(only_borya))
print(' '.join(map(str, only_borya)))
