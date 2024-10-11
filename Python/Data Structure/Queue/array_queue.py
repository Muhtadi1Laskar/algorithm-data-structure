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
    
    def dequeue(self):
        if self.is_empty():
            return None
        item_to_remove = self.array[self.front]
        self.front = (self.front + 1) % self.size
        self.count -= 1
        return item_to_remove
    
    def log(self):
        if self.is_empty():
            return None
        
        result = []
        for i in range(0, self.count):
            result.append(str(self.array[(self.front + i) % self.size]))

        return " | ".join(result)
    
    def is_empty(self):
        return self.count == 0
    
    def is_full(self):
        return self.count == self.size
    


queue = CircularQueue(10)

for i in range(1, 15):
    queue.enqueue(i)


print(queue.array)

queue.dequeue()
queue.dequeue()
queue.dequeue()

print(queue.log())

queue.enqueue(100)
queue.enqueue(200)

print(queue.log())

