class HashMap:
    def __init__(self, size=10):
        self.size = size
        self.array = [None] * size

    def set(self, key, value):
        hashed_key = hash(key)
        index = hashed_key % self.size

        # Handle collisions using linear probing
        while self.array[index] is not None:
            index = (index + 1) % self.size

        self.array[index] = (key, value)

    def get(self, key):
        hashed_key = hash(key)
        index = hashed_key % self.size

        # Handle collisions using linear probing
        while self.array[index] is not None and self.array[index][0] != key:
            index = (index + 1) % self.size

        if self.array[index] is None:
            return None
        else:
            return self.array[index][1]


obj = HashMap(10)

items = [("Name", "Luffy"), ("Occupation", "Pirate"), ("Age", 20), ("Favourite Food", "Meat"), ("Devil Fruit User", True)]

for elem in items:
    key, item = elem
    obj.set(key, item)

print(obj.array)

for key, value in items:
    item = obj.get(key)

    if item == value:
        print(key, value)