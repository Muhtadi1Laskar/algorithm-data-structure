class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
        this.tail = this.head;
        this.len = 0;
    }
    
    isEmpty() {
        if(!this.head) {
            return true;
        }
        return false;
    }

    preAppend(value) {
        const newNode = new Node(value);

        if(this.isEmpty()) {
            this.addToEmptyList(newNode);
            return;
        }
        newNode.next = this.head;
        this.head = newNode;
        this.len++;
        return;
    }

    append(value) {
        const newNode = new Node(value);

        if(this.isEmpty()) {
            this.addToEmptyList(newNode);
            return;
        }
        this.tail.next = newNode;
        this.tail = newNode;
        this.len++;
        return;
    }

    insert(index, value) {
        if(index < 0 ) {
            return "Index out of range";
        }
        if(index === 1) {
            this.preAppend(value);
            return;
        }
        const newNode = new Node(value);
        let previousNode = this.traverse(index-1);
        newNode.next = previousNode.next;
        previousNode.next = newNode;
        this.len++;
        return;
    }

    pop() {
        const item = this.head.value;
        this.head = this.head.next;
        this.len--;
        return item;
    }

    addToEmptyList(newNode) {
        this.head = newNode;
        this.tail = this.head;
        this.len++;
    }

    traverse(index) {
        let currentNode = this.head;

        for(let i=1;i<index;i++) {
            if(!currentNode) {
                return;
            }
            currentNode = currentNode.next;
        }
        return currentNode;
    }

    print() {
        if(this.isEmpty()) {
            return "The List is empty";
        }
        const array = [];
        let currentNode = this.head;

        while(currentNode) {
            array.push(currentNode.value);
            currentNode = currentNode.next;
        }
        return array;
    }
}

const linkedList = new LinkedList();

linkedList.append('C');
linkedList.append('JavaScript');
linkedList.append('Python');
linkedList.append('Julia');
linkedList.append('Haskell');
linkedList.append('Clojure');
linkedList.append('Odin');

console.log(linkedList.print());

linkedList.preAppend('Assembly');
linkedList.preAppend('Machine Code');

console.log(linkedList.print());

linkedList.insert(10, 'x64 Assembly');

console.log(linkedList.print());

linkedList.pop();
linkedList.pop();
linkedList.pop();

console.log(linkedList.print());