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

    addToEmptyList(newNode) {
        this.head = newNode;
        this.tail = this.head;
        this.len++;
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
