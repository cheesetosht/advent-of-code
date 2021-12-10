def get_incr_count(arr):
    incr_count = 0
    for i in range(1, len(arr)):
        if(arr[i] > arr[i-1]):
            incr_count += 1
    return incr_count


def sliding_window(arr):
    window_sums = []
    rem = len(arr) % 3
    for i in range(0, len(arr)-rem):
        window_sums.append(sum(arr[i:i+3]))
    return get_incr_count(window_sums)


def get_input():
    inputs = []
    with open("input.txt", "r") as f:
        for line in f:
            inputs.append(int(line.strip()))
    return inputs


def main():
    depths = get_input()
    print(get_incr_count(depths))
    print(sliding_window(depths))


if __name__ == '__main__':
    main()
