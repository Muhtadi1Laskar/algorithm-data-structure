class StaticArray:
    def __init__(self, capacity) -> None:
        self.capacity = capacity
        self.array = [0] * capacity
        self.array_len = 0

    def create_array(self) -> list:
        idx = 0

        while idx < self.capacity:
            value = int(input("Enter the value: "))
            self.array[idx] = value
            idx += 1
            self.array_len += 1

        return self.array

    def insert_item(self, idx, item) -> list:
        if idx > self.array_len:
            return "Out of index"

        self.array[idx] = item

        return self.array

    def reset_array(self) -> list:
        self.array = [0] * self.capacity
        return self.array

    def get_capacity(self) -> int:
        return self.capacity

    def get_len(self) -> list:
        return self.array_len

    def print_item(self) -> list:
        return self.array


array_obj = StaticArray(3)
array = array_obj.create_array()

print(array_obj.insert_item(24, 34344))
