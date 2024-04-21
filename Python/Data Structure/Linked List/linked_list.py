class Node:
    def __init__(self, value):
        self.value = value
        self.next = None
    

class LinkedList:
    def __init__(self, value):
        self.head = Node(value)
        self.tail = self.head
        self.length = 1

    def insert_item(self, value):
        new_node = Node(value)
        self.tail.next = new_node
        self.tail = new_node
        self.length += 1

        return None 
    
    def print_list(self):
        li = []
        current_node = self.head

        while current_node:
            li.append(current_node.value)
            current_node = current_node.next
        
        return li


linked_list = LinkedList('C')

linked_list.insert_item('JavaScript')
linked_list.insert_item('Python')
linked_list.insert_item('Haskell')
linked_list.insert_item('Ruby')
linked_list.insert_item('Clojure')

print(linked_list.print_list())
