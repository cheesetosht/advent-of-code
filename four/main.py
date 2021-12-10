x = 0
y = 0
aim = 0


def move(cmd):
    global x
    global y
    global aim
    direction = cmd.split(" ")[0]
    magnitude = int(cmd.split(" ")[1])

    if(direction == "forward"):
        x += magnitude
        y += aim * magnitude
    elif(direction == "up"):
        aim -= magnitude
    elif(direction == "down"):
        aim += magnitude
    else:
        print("fuck u")


def get_input():
    inputs = []
    with open(r"D:\Repositories\AdventOfCode\2021\day2\input.txt", "r") as f:
        for line in f:
            inputs.append(line.strip())
    return inputs


def main():
    commands = get_input()
    for command in commands:
        move(command)
    return print(x * y)


if __name__ == '__main__':
    main()
