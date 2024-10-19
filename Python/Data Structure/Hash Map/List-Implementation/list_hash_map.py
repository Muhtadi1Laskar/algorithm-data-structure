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
        self.array = [0] * size
    
    def get(self, key, value):
        pass


hash_map = HashMap(10)

li = LinkedList()

li.insert(1, "Luffy")
li.insert(2, "Zoro")
li.insert(3, "Sanji")
li.insert(4, "Nami")
li.insert(5, "Usopp")
li.insert(6, "Chopper")


print(li.print())


