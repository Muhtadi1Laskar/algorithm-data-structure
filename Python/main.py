class Node:
    def __init__(self, value, next=None):
        self.value = value
        self.next = next

class LinkedList:
    def __init__(self):
        self.head = None
        self.length = 0
    
    def is_empty(self):
        return not self.head
    
    def pre_append(self, data):
        new_node = Node(data, self.head)
        self.head = new_node
        self.length += 1
        return

    def append(self, data):
        new_node = Node(data)

        if self.is_empty():
            self.head = new_node
            self.length += 1
            return

        current_node = self.head

        while current_node.next:
            current_node = current_node.next
        
        current_node.next = new_node
        self.length += 1
        return
    
    
    def insert(self, data, index):
        if index <= 0 or index > self.length + 1:
            print("Index out of range")
            return
        
        if index == 1:
            self.pre_append(data)
            return
        
        prev_node = self.head
        new_node = Node(data)

        for i in range(1, index-1):
            prev_node = prev_node.next
        
        new_node.next = prev_node.next
        prev_node.next = new_node
        self.length += 1
        return
    
    def log(self):
        result = []
        current_node = self.head

        while current_node:
            result.append(current_node.value)
            current_node = current_node.next
        
        return result


linked_list = LinkedList()

linked_list.append('C')
linked_list.append('JavaScript')
linked_list.append('Python')
linked_list.append('Haskell')
linked_list.append('Clojure')
linked_list.append('Odin')

print(linked_list.log())
print(linked_list.length)

linked_list.pre_append("Assembly")
linked_list.pre_append("Machine Code")

print(linked_list.log())

linked_list.insert("Julia", 6)

print(linked_list.log())
