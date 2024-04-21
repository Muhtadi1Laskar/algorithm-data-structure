class DynamicArray:
    def __init__(self) -> None:
        self.capacity = 2
        self.arr = [0] * self.capacity
        self.arr_len = 0

    def push_back(self, item) -> None:
        if self.arr_len == self.capacity:
            self.resize()

        self.arr[self.arr_len] = item
        self.arr_len += 1

    def resize(self) -> None:
        self.capacity = 2 * self.capacity
        new_arr = [0] * self.capacity

        for i in range(self.arr_len):
            new_arr[i] = self.arr[i]

        self.arr = new_arr

    def get(self, idx: int):
        if idx > self.arr_len or idx < -1:
            return "Out of index"
        return self.arr[idx]

    def insert(self, idx, item) -> None:
        if idx > self.arr_len or idx < -1:
            return "Out of index"

        if self.arr_len == self.capacity:
            self.resize()

        for i in range(self.arr_len - 1, idx - 1, -1):
            self.arr[i + 1] = self.arr[i]

        self.arr[idx] = item
        self.arr_len += 1

    def pop_back(self):
        item = self.arr[self.arr_len]
        self.arr[self.arr_len - 1] = 0
        self.arr_len -= 1

        return item

    def pop_front(self):
        item = self.arr[0]

        for i in range(0, self.arr_len):
            self.arr[i] = self.arr[i + 1]
        self.arr[self.arr_len] = 0
        self.arr_len -= 1

        return item

    def print_arr(self) -> None:
        idx = 0

        while idx < self.arr_len:
            print(self.arr[idx], "\t")
            idx += 1


array = DynamicArray()

array.push_back(1)
array.push_back(2)
array.push_back(3)
array.push_back(4)
array.push_back(5)
array.push_back(6)
array.push_back(7)
array.push_back(8)
array.push_back(9)
array.push_back(10)

array.insert(2, 101)

print(array.print_arr())

item = array.pop_front()

print(array.print_arr())
