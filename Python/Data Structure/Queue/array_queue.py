class CircularQueue:
    def __init__(this, size):
        this.size = size
        this.array = [0] * size
        this.front = 0
        this.rear = 0
        this.count = 0
    


queue = CircularQueue(10)
