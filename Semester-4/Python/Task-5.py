#1
'''
d1 = {'a':300, 'b':400}
d2 = {'c':500, 'd':600}
d3 = {**d1, **d2}
print(d3)
'''

#2
'''d = {'a':300, 'b':400}
pr = 1
for i in d.values():
    pr *= i
print(pr)'''

#3
'''a1 = ['1', '2', '3']
a2 = [3, 4, 5]
d = dict(zip(a1, a2))
print(d)
'''

#4 дублируется

#5
'''ss= [dict.fromkeys('AEIOULNSTR'.strip(), 1),
dict.fromkeys('DG'.strip(), 2),
dict.fromkeys('BCMP'.strip(), 3),
dict.fromkeys('FHVW'.strip(), 4),
dict.fromkeys('K'.strip(), 5),
dict.fromkeys('JX'.strip(), 8),
dict.fromkeys('QZ'.strip(), 10)]

aa = [dict.fromkeys('АВУИНОРСТ'.strip(), 1),
dict.fromkeys('ДКЛМПУ'.strip(), 2),
dict.fromkeys('БГЁЬЯ'.strip(), 3),
dict.fromkeys('ЙЫ'.strip(), 4),
dict.fromkeys('ЖЗХЦЧ'.strip(), 5),
dict.fromkeys('ШЭЮ'.strip(), 8),
dict.fromkeys('ФЩЪ'.strip(), 10)]

s = {}
a = {}
for i in ss:
    s.update(i)
for i in aa:
    a.update(i)


st = input().upper().strip()
score = 0
if (u'\u0400' <= st[0] <= u'\u04FF' or u'\u0500' <= st[0] <= u'\u052F'):
    values = list(map(a.get, st))
    score = sum(values)
else:
    values = list(map(s.get, st))
    score = sum(values)
print(score)'''


#6
'''s = 'pythonist'
key = set(s.strip())
value = [s.count(i) for i in key]

d = dict(zip(key, value))
print(d)'''

#7


