class NewItem {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class Queue {
    constructor() {
        this.firstItem = null;
        this.lastItem = this.firstItem;
        this.len = 0;
    }

    isEmpty() {
        return !this.firstItem;
    }

    enqueue(value) {
        const newNode = new NewItem(value);

        if (this.isEmpty()) {
            this.firstItem = newNode;
            this.lastItem = this.firstItem;
            this.len += 1;
            return;
        }
        newNode.next = this.firstItem;
        this.firstItem = newNode;
        this.len++;
        return;
    }

    dequeue() {
        if (this.firstItem === this.lastItem) {
            this.firstItem = null;
            this.lastItem = this.firstItem;
            this.len--;
            return;
        }
        let previousNode = this.firstItem;

        while (previousNode.next !== this.lastItem) {
            previousNode = previousNode.next;
        }
        this.lastItem = previousNode;
        this.lastItem.next = null;
        this.len--;
        return;
    }

    peak() {
        return this.firstItem.value;
    }

    len() {
        return this.len;
    }

    print() {
        let queue = [];
        let currentNode = this.firstItem;

        while (currentNode) {
            queue.push(currentNode.value);
            currentNode = currentNode.next;
        }
        return queue;
    }
}

const queue = new Queue();

queue.enqueue('Batman');
queue.enqueue('Superman');
queue.enqueue('Wonder Woman');
queue.enqueue('Flash');
queue.enqueue('Martain Manhunter');

console.log(queue.print());

queue.dequeue();
queue.dequeue();
queue.dequeue();

console.log(queue.print());