class Bag:
    def __init__(self):
        self.bag = []
        self.len = 0

    def push(self, value):
        self.bag.append(value)
        self.len += 1
        return

    def get_len(self):
        return self.len

    def log(self):
        idx = 0

        while idx < self.len:
            print(self.bag[idx])

            idx += 1
        return

    def search(self, value):
        for idx, elem in enumerate(self.bag):
            if elem == value:
                return idx
        return None

    def remove(self, index):
        if index < 0 or index > self.len:
            return None

        idx = index
        while idx < self.len - 1:
            self.bag[idx] = self.bag[idx + 1]
            idx += 1
        self.bag[self.len - 1] = ""


bag = Bag()

bag.push("Saitama")
bag.push("Luffy")
bag.push("Naruto")
bag.push("Ichigo")

print(bag.get_len())
print(bag.log())
print(bag.search("Naruto"))

print(bag.remove(0))
