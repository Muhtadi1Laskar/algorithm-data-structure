class Stack:
    def __init__(self, size):
        self.top = -1
        self.array_size = size
        self.stack = size * [0]
    
    def push(self, value):
        if self.top == self.array_size - 1:
            self.resize()
        self.top = self.top + 1
        self.stack[self.top] = value
        
        print(self.stack[self.top])
    
    def resize(self):
        self.array_size = self.array_size * 2
        new_stack = self.array_size * [0]

        for idx, item in enumerate(self.stack):
            new_stack[idx] = item
        self.stack = new_stack
    
    def log(self):
        return self.stack


stack = Stack(5)

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

print(stack.log())

stack.push('Number')
stack.push('Number')

print(stack.log())
