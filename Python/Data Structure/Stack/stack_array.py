class Stack:
    def __init__(self):
        self.stack = []
        self.length = 0
    
    def add(self, value):
        if not self.stack:
            self.stack.append(value)
            self.length += 1
            return
        
        self.stack.append(None)
        
        for i in range(self.length-1, 0-1, -1):
            self.stack[i+1] = self.stack[i]

        self.stack[0] = value
        self.length += 1
    
    def print_list(self):
        return self.stack


stack = Stack()

stack.add(1)
stack.add(2)
stack.add(3)
stack.add(4)
stack.add(5)

print(stack.print_list())