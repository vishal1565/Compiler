n = int(input("Enter no of states: "))
sym = int(input("Enter no of input symbols: "))
temp, stateTable = [10], []
print("Enter Transition Table in format | State-No | Input | Next-State |")
while sum(temp)!=-3:
    temp = [int(i) for i in input().split()]
    stateTable.append(temp)
del stateTable[-1]
stateTable.sort()
finalState = [int(i) for i in input("Enter Final States: ").split()]

while(True):
    s = [int(i) for i in input("Enter String to check for: ").split()]
    stack, newStack, curr = [0], [], 0

    for i in range(len(s)):
        for j in stack:
            for k in stateTable:
                if k[0]==j and k[1]==s[i]:
                    newStack.append(k[2])
        stack = newStack
        newStack = []

    flag = False
    for i in stack:
        if i in finalState:
            flag = True
            print("String ACCEPTED")
    if not flag:
        print("String NOT ACCEPTED")