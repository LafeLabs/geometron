
f = open('hypercube.txt', 'r')
hypercubestring = f.read()
f.close()

hypercube = []
for index in range(1024):
    hypercube.append("")

inputarray = hypercubestring.split("\n")

for index in range(len(inputarray)):
    foo = inputarray[index].split(":")
    address = int(foo[0],8)
    bytecode = foo[1]
    hypercube[address] = foo[1]

print hypercube[01330]