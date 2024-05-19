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

    append(value) {
        const newNode = new Node(value);

        if(this.isEmpty()) {
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

console.log(linkedList.print());