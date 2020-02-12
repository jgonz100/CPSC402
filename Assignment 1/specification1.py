# CPSC 402, Dr. Alexander Kurz
# Jadyn Gonzalez and Michelle Kutsanov

# FSM based on the matching pattern abab
with open("specification1.txt") as f:
    state = 0
    i = 1
    matches = []
    for line in f:  
       for c in line:
           if state == 0 and (c == 'b' or c == 'c'):
               state = 0
           elif state == 0 and c == 'a':
               state = 1
           elif state == 1 and c == 'a':
               state = 1
           elif state == 1 and c == 'c':
               state = 0
           elif state == 1 and c == 'b':
               state = 2
           elif state == 2 and (c == 'b' or c == 'c'):
               state = 0
           elif state == 2 and c == 'a':
               state = 3
           elif state == 3 and c == 'a':
               state = 1
           elif state == 3 and c == 'c':
               state = 0
           elif state == 3 and c == 'b':
               state = 4
               matches.append(i)
           elif state == 4 and (c == 'b' or c == 'c'):
               state = 0
           elif state == 4 and c == 'a':
               state = 3
           i+=1
    print(matches)

