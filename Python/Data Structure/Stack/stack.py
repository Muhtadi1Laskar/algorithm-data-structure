class NewItem:
    def __init__(self, item):
        self.item = item
        self.next = None

class Stack:
    def __init__(self, item):
        self.head = NewItem(item)
        self.tail = self.head
        self.length = 1
    
    def push(self, item):
        new_node = NewItem(item)
        new_node.next = self.head
        self.head = new_node
        self.length += 1
        return None

    def pop(self):
        if self.length <= 0:
            return "Index out of range"
        
        self.head = self.head.next
        self.length -= 1
        return None

    def peak(self):
        if self.length <= 0:
            return "The List is empty"

        item = self.head.item
        return item

    def print_stack(self):
        current_item = self.head
        li = []
        
        while current_item:
            li.append(current_item.item)
            current_item = current_item.next
        return li
    

stack = Stack(1)

stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

print(stack.print_stack())

stack.pop()
stack.pop()
stack.pop()
stack.pop()

print(stack.print_stack())

stack.push(1000)

print(stack.peak())
