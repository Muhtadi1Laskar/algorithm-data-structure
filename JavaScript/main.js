class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.len = 0;
    }

    isEmpty() {
        return this.head !== null;
    }

    preAppend(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.tail = this.head;
            this.len++;
            return;
        }
        newNode.next = this.head;
        this.head = newNode;
        this.len++
        return;
    }

    append(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.tail = this.head;
            this.len++;
            return;
        }

        this.tail.next = newNode;
        this.tail = newNode;
        this.len++;
        return;
    }

    print() {
        const result = [];
        let currentNode = this.head;

        while (currentNode) {
            result.push(currentNode.value);
            currentNode = currentNode.next;
        }
        return result;
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

linkedList.preAppend('Assembly Language');
linkedList.preAppend('Machine Learning');

console.log(linkedList.print());
