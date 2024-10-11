class CircularQueue:
    def __init__(self, size):
        self.size = size
        self.array = [0] * size
        self.front = 0
        self.rear = 0
        self.count = 0

    def enqueue(self, value):
        if self.is_full():
            return None
        self.array[self.rear] = value
        self.rear = (self.rear + 1) % self.size
        self.count += 1
        return
    
    def is_empty(self):
        return self.count == 0
    
    def is_full(self):
        return self.count == self.size
    


queue = CircularQueue(10)

for i in range(1, 15):
    queue.enqueue(i)


print(queue.array)
