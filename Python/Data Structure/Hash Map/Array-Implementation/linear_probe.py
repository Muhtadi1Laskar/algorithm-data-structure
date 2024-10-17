class HashMap:
    def __init__(self, size=10):
        self.size = size
        self.array = [0] * size
    
    def set(self, key, value):
        hashed_key = hash(key)
        index = hashed_key % self.size

        while self.array[index] is not None:
            index = (index + 1) % self.size
        
        self.array[index] = (key, value)
        return
    