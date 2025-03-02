with open('achievement_data.txt', 'r') as file:
    for line in file:
        strings = line.split('"')
        if len(strings) >= 3:
            print(strings[3])