#1
'''
print('KubSU'*1920)
'''

#2
'''
print(int('1'*153)**2)
'''

#3
'''
print(int(str(13**12)*12)**2)
'''

#4
'''
s = input()
if (s.islower()):
    print('lower')
elif (s.isupper()):
    print('upper')
elif (s.istitle()):
    print('title')
else:
    print('unusual string')
'''

#5
'''
s = input()
lower = 0
upper = 0
for i in s:
    if (i.islower()):
        lower += 1
    else:
        upper += 1
if (lower > upper):
    print(s.lower())
else:
    print(s.upper())
'''

#6
'''
b = int(input())
print(b + int(str(b)*2) + int(str(b)*3))
'''

#7
'''
s = input()
subs = input()
print(s.count(subs))
'''

#8
'''
n = input()
for i in range(4):
    print(n[i])
'''

#9
'''
string = input().split()
final_string = ''

for s in string:
    word = ''
    for i in range(len(s)):
        if i % 2 == 0:
            word += s[i].upper() 
        else:
            word += s[i].lower()
    final_string += word + ' ' 

print(final_string
'''

#10
'''
s = input()
n = len(s) // 2
sym = True
if (len(s) % 2 == 0):
    sym = s[:n] == s[n:]
else:
    sym = s[:n] == s[n+1:]
print(sym)
'''
