class CircularQueue {
    constructor(size) {
        this.size = size;
        this.array = [];
        this.front = 0;
        this.rear = 0;
        this.count = 0;
    }

    isFull() {
        return this.count === this.size;
    }

    isEmpty() {
        return this.count === 0;
    }
}

const queue = new CircularQueue(10);