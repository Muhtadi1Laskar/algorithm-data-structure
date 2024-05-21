class Node:
    def __init__(self, value) -> None:
        self.value = value
        self.next = None
    
class LinkedList:
    def __init__(self) -> None:
        self.head = None
        self.tail = self.head
        self.length = 0
    
    def is_empty(self):
        if not self.head:
            return True
        return False
    
    def pre_append(self, value) -> None:
        new_node = Node(value)

        if self.is_empty():
            self.head = new_node
            self.tail = self.head
            self.length += 1
            return None

        new_node.next = self.head
        self.head = new_node
        self.length += 1
        return None
    
    def append(self, value) -> None:
        new_node = Node(value)

        if self.is_empty():
            self.head = new_node
            self.tail = self.head
            self.length += 1
            return None

        self.tail.next = new_node
        self.tail = new_node
        self.length += 1
        return None
    
    def insert(self, index, value):
        if index <= 0:
            raise IndexError("Index out of range")
        
        if self.is_empty():
            self.append(value)
            return None

        if index == 1:
            self.pre_append(value)
            return None

        new_node = Node(value)
        previous_node = self.traverse(index-1)
        new_node.next = previous_node.next
        previous_node.next = new_node
        self.length += 1
        return None
    
    def delete(self, index):
        if index <= 0:
            return IndexError("Index out of range")
        
        if index == 1:
            self.head = self.head.next
            self.length -= 1
            return None
        
        previous_node = self.traverse(index-1)
        unwanted_node = previous_node.next
        previous_node.next = unwanted_node.next
        self.length -= 1

        return None
    
    def traverse(self, index):
        if self.is_empty():
            return None
        current_node = self.head

        for _ in range(1, index):
            if not self.head:
                return None
            current_node = current_node.next
        return current_node
        

    def search(self, index):
        if self.is_empty():
            return None
        current_node = self.head

        for _ in range(1, index):
            if not self.head:
                return None
            current_node = current_node.next
        return current_node.value
    
    def print_list(self) -> list:
        li = []

        if self.is_empty():
            return li
        
        current_node = self.head

        while current_node:
            li.append(current_node.value)
            current_node = current_node.next
        
        return li

    def get_length(self):
        return self.length

linked_list = LinkedList()

linked_list.append('C')
linked_list.append('JavaScript')
linked_list.append('Python')
linked_list.append('Haskell')
linked_list.append('Clojure')
linked_list.append('Odin')

print(linked_list.print_list())
print(linked_list.get_length())

linked_list.pre_append('Assembly')

print(linked_list.print_list())

print(linked_list.insert(8, 'S'))
print(linked_list.print_list())

linked_list.delete(7)

print(linked_list.print_list())