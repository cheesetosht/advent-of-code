def get_solution(numbers):
    mcbs = ""
    lcbs = ""
    for index in range(0, len(numbers[0])):
        zero_count = 0
        one_count = 0
        for number in numbers:
            digits = list(number)
            if(int(digits[index]) == 1):
                one_count += 1
            else:
                zero_count += 1
        print(zero_count, one_count)
        if(one_count > zero_count):
            mcbs += "1"
            lcbs += "0"
        else:
            lcbs += "1"
            mcbs += "0"

    return int(mcbs, 2) * int(lcbs, 2)


def get_input():
    inputs = []
    with open(r"D:\Repositories\AdventOfCode\2021\day3\input.txt", "r") as f:
        for line in f:
            inputs.append(line.strip())
    return inputs


def main():
    numbers = get_input()
    get_solution(numbers)


if __name__ == '__main__':
    main()
