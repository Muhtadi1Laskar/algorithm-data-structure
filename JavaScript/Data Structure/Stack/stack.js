class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class Stack {
    constructor() {
        this.firstItem = null;
        this.lastItem = this.firstItem;
        this.len = 0;
    }

    isEmpty() {
        return !this.firstItem;
    }

    push(value) {
        const newItem = new Node(value);

        if (this.isEmpty()) {
            this.firstItem = newItem;
            this.lastItem = this.firstItem;
            this.len += 1;
            return;
        }
        newItem.next = this.firstItem;
        this.firstItem = newItem;
        this.len++;
        return;
    }

    pop() {
        if (this.len < 0) {
            return "The stack is empty";
        }
        const item = this.firstItem;
        this.firstItem = this.firstItem.next;
        this.len--;
        return item;
    }

    peak() {
        return this.firstItem.value;
    }

    print() {
        let stack = [];
        let currentNode = this.firstItem;

        while (currentNode) {
            stack.push(currentNode.value);
            currentNode = currentNode.next;
        }
        return stack;
    }
}

const stack = new Stack();

stack.push('React.js');
stack.push('Angular.js');
stack.push('Solid.js');
stack.push('Django');
stack.push('Flask');
stack.push('Fast API');

console.log(stack.len);
console.log(stack.print());

stack.pop();
stack.pop();

console.log(stack.print());
console.log(stack.peak());
