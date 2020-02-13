#Does the file contain the sequence abc*cba?
#Here, * is a wildcard that stands for zero or more occurrences of any character.
#For example, if the file is abccbabcbacba the output should be [6,10,13].

def run_spec2():
    with open("texts/specification2.txt") as f:
        state = 0
        i = 1
        matches = []
        for line in f:
            for c in line:
                if state == 0 and c == 'b':
                    state = 0
                elif state == 0 and c == 'c':
                    state = 0
                elif state == 0 and c == 'a':
                    state = 1
                elif state == 1 and c == 'c':
                    state = 1
                elif state == 1 and c == 'b':
                    state = 2
                elif state == 1 and c == 'a':
                    state = 0
                elif state == 2 and c == 'a':
                    state = 4
                    matches.append(i)
                elif state == 2 and c == 'b':
                    state = 0
                elif state == 2 and c == 'c':
                    state = 3
                elif state == 3 and c == 'a':
                    state = 0
                elif state == 3 and c == 'b':
                    state = 1
                elif state == 3 and c == 'c':
                    state = 1
                elif state == 4 and c == 'a':
                    state = 0
                elif state == 4 and c == 'b':
                    state = 1
                elif state == 4 and c == 'c':
                    state = 1
                i += 1
        print(matches)