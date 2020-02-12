# CPSC 402, Dr. Alexander Kurz
# Jadyn Gonzalez and Michelle Kutsanov

# FSM based on the matching pattern aa|aab
with open("specification3.txt") as f:
    state = 0
    i = 1
    matches = []
    for line in f:
        for c in line:
            if state == 0 and c == 'b':
                state = 0
            elif state == 0 and c == 'a':
                state = 1
            elif state == 1 and c == 'a':
                state = 2
                matches.append(i)
            elif state == 2 and c == 'b':
                state = 3
            elif state == 2 and c == 'a':
                state = 2
                matches.append(i)
            elif state == 2 and c == 'b':
                state = 3
            elif state == 3 and c == 'a':
                state = 1
            elif state == 3 and c == 'b':
                state = 4
                matches.append(i)
            elif state == 4 and c == 'a':
                state = 1
            elif state == 4 and c == 'b':
                state = 0
            i += 1
    print(matches)