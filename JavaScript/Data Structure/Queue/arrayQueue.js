class CircularQueue {
    constructor(size) {
        this.size = size;
        this.array = new Array(this.size);
        this.front = 0;
        this.rear = 0;
        this.count = 0;
    }

    enqueue(value) {
        if(this.isFull()) {
            return null;
        }
        this.array[this.rear] = value;
        this.rear = (this.rear + 1) % this.size;
        this.count += 1;
        return this;
    }

    isFull() {
        return this.count === this.size;
    }

    isEmpty() {
        return this.count === 0;
    }
}

const queue = new CircularQueue(10);

for(let i = 1; i <= 10; i++) {
    queue.enqueue(i*2);
}

console.log(queue.array);