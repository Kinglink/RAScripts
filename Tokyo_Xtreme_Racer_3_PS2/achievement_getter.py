with open('Achievements.txt', 'r') as file:
    for line in file:
        strings = line.split(':')
        if len(strings) >= 2:
            print(strings[2])