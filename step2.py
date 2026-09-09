from matplotlib import pyplot
x = []
y = []
with open(r'C:\Users\User\Downloads\coords.txt') as f: 
    for line in f: 
        values = line.strip().split()
        x.append(int(values[0]))
        y.append(int(values[1]))
mins = [] 
maxs = []
for i in range(len(x)): 
    mins.append(min(x[i], y[i])) 
    maxs.append(max(x[i], y[i]))
pyplot.plot(mins, label='min(x, y)') # из-за отсутсвия 2-х аргументов функция использует в качестве аргумента x последовательность 0, 1, ..., len(mins) - 1
pyplot.plot(maxs, label='max(x, y)')
for i in range(len(x)): 
    if mins[i] == maxs[i]: 
        pyplot.plot(i, mins[i], 'ro') # ro = точки пересечения - красные кружки
pyplot.xlabel('Номер точки') 
pyplot.ylabel('Значение') 
pyplot.legend() 
pyplot.grid()
pyplot.savefig(r'C:\Users\User\Downloads\result.pdf')
pyplot.show()
