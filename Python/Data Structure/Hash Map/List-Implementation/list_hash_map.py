class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

class HashMap:
    def __init__(self, size=10):
        self.size = size
        self.array = [0] * size


hash_map = HashMap(10)
