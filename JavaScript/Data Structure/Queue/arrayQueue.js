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

    dequeue() {
        if(this.isEmpty()) {
            return null;
        }
        const value = this.array[this.front];
        this.front = (this.front + 1) % this.size;
        this.count--;
        return value;
    }

    print() {
        let result = "";
        for(let i=0;i<this.count;i++) {
            result += this.array[(this.front + i)%this.size] + " | ";
        }
        return result;
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

queue.dequeue();
queue.dequeue();
queue.dequeue();

console.log(queue.array);

queue.enqueue("New Elements 1");
queue.enqueue("New Elements 2");

console.log(queue.print());