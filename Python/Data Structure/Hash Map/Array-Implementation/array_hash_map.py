class HashMap:
    def __init__(self, size=10):
        self.size = size
        self.array = [[] for _ in range(size)]
    
    def set(self, key, value):
        hashed_key = hash(key)
        index = hashed_key % self.size

        for i, (k, v) in enumerate(self.array[index]):
            if k == key:
                self.array[index][i] = (key, value)
                return

        self.array[index].append((key, value))
        return
    
    def get(self, key):
        hashed_key = hash(key)
        index = hashed_key % self.size

        for k, v in self.array[index]:
            if k == key:
                return v

        return None

hash_map = HashMap()


items = [("Name", "Luffy"), ("Occupation", "Pirate"), ("Age", 20), ("Favourite Food", "Meat"), ("Devil Fruit User", True)]

for key, value in items:
    hash_map.set(key, value)

print(hash_map.array)

print(hash_map.get("Devil Fruit User"))