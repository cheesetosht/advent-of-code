def main():
    depths = getInput()
    print(getIncrCount(depths))
    print(slidingWindow(depths))


if __name__ == '__main__':
    main()


def getInput():
    inputs = []
    with open(r"D:\Repositories\AdventOfCode\2021\day1\input.txt", "r") as f:
        for line in f:
            inputs.append(int(line.strip()))
    return inputs


def getIncrCount(arr):
    incr_count = 0
    for i in range(1, len(arr)):
        if(arr[i] > arr[i-1]):
            incr_count += 1
    return incr_count


def slidingWindow(arr):
    window_sums = []
    rem = len(arr) % 3
    for i in range(0, len(arr)-rem):
        window_sums.append(sum(arr[i:i+3]))
    print(getIncrCount(window_sums))
