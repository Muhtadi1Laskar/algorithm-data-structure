class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None
    
    def insert(self, key, value):
        new_node = Node(key, value)

        if self.head is None:
            self.head = new_node
        else:
            current = self.head
            while current:
                if current.key == key:
                    current.value = value
                    return
                if current.next is None:
                    break
                current = current.next
            current.next = new_node
    
    def get(self, key):
        if self.head is None:
            return None
        current_node = self.head

        while current_node:
            if current_node.key == key:
                return current_node.value
            current_node = current_node.next
        return None
        
    def print(self):
        result = []
        current_node = self.head

        while current_node:
            result.append((current_node.key, current_node.value))
            current_node = current_node.next
        
        return result

class HashMap:
    def __init__(self, size=10):
        self.size = size
        self.array = [LinkedList() for _ in range(size)]
    
    def _hash(self, key):
        return hash(key) % self.size
    
    def set(self, key, value):
        index = self._hash(key)
        self.array[index].insert(key, value)

    def print_map(self):
        for i, bucket in enumerate(self.array):
            current = bucket.head
            print(f"Bucket {i}: ", end="")
            while current:
                print(f"({current.key}: {current.value}) -> ", end="")
                current = current.next
            print("None")

hash_map = HashMap(10)

items = [
    ("Name", "Luffy"),
    ("Occupation", "Pirate"),
    ("Age", 20),
    ("Favourite Food", "Meat"),
    ("Devil Fruit User", True),
]

for key, value in items:
    hash_map.set(key, value)


print(hash_map.print_map())




