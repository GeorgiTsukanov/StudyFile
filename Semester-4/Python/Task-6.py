#1
'''
with open("f1.txt", "r") as file:
    kol_string = 0
    kol_word = 0
    for line in file:
        kol_string += 1
        kol_word += len(line.split())
    print(kol_string, kol_word)
'''

#2
'''
with open("f2.txt", "r") as file:
    a = []
    for line in file:
        a = list(a+(line.rstrip(",!?.")).split())
    print(a)

    maxS = a[0]
    for i in a:
        if len(i) > len(maxS):
            maxS = i
    print(maxS)
'''

#3
'''
mydict = dict.fromkeys([str(i) for i in range(10)], '#')
with open("f3.txt", "r") as file:
    mystring = ''
    for line in file:
        mystring = mystring.join(mydict.get(char, char) for char in line)
    with open("f3_2.txt", "w") as file2:
        file2.write(mystring)
'''

#4
'''
with open("f4.txt", "r") as file:
    word = 'python'
    for line in file:
        if (line.lower().find(word) != -1):
            with open("f4_2.txt", "a") as file2:
                file2.write(line)
'''

#5
'''
with open("f5.txt", "r") as file:
'''

#6
'''
a = []
b = []
with open("f6_1.txt", "r") as file:
    a = [int(line) for line in file]
with open("f6_2.txt", "r") as file:
    b = [int(line) for line in file]

c = sorted(list(a+b))
c = [str(i) for i in c]
with open("f6_3.txt", "w") as file:
    for i in c:
        file.write(i + '\n')
'''

#7
