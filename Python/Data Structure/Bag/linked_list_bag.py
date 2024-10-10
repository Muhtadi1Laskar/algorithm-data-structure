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


bag = Bag()
