class Node:
    def __init__(self, value):
        self.value = value
        self.next = None
    
class Bag:
    def __init__(self):
        self.head = None
        self.tail = self.head
        self.len = 0

    def is_empty(self):
        return not self.head
    
    def push(self, value):
        new_node = Node(value)

        if self.is_empty():
            self.head = new_node
            self.tail = self.head
            self.len += 1
            return

        self.tail.next = new_node
        self.tail = new_node
        self.len += 1
        return
    
    def search(self, index):
        if self.is_empty() or index < 0 or index > self.len:
            return None
        
        current_node = self.head
        for i in range(1, index):
            current_node = current_node.next
        
        return current_node.value

    def log(self):
        if self.is_empty():
            return None
        current_node = self.head
        result = []

        while current_node:
            result.append(current_node.value)
            current_node = current_node.next
        
        return " ---> ".join(result)


bag = Bag()

bag.push("Saitama")
bag.push("Luffy")
bag.push("Naruto")
bag.push("Ichigo")

print(bag.log())

print(bag.search(1))
print(bag.search(2))
print(bag.search(3))
print(bag.search(4))
