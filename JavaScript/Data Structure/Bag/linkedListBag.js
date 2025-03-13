class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
        this.length = 0;
    }

    push(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.length += 1;
            return;
        }
        let currentNode = this.head;

        while (currentNode.next) {
            currentNode = currentNode.next;
        }
        currentNode.next = newNode;
        this.length++
        return;
    }

    greatest() {
        let currentNode = this.head;
        let max = this.head;

        while (currentNode) {
            if (max.value.length < currentNode.value.length) {
                max = currentNode;
            }
            currentNode = currentNode.next;
        }
        return max.value;
    }

    print() {
        let result = [];
        let currentNode = this.head;

        for (; currentNode; currentNode = currentNode.next) {
            result.push(currentNode.value);
        }
        return result.join(" ---> ")
    }
}

const list = new LinkedList();

list.push("C");
list.push("Python");
list.push("JavaScript");
list.push("Ruby");
list.push("Haskell");
list.push("Odin");
list.push("Assembly");

console.log(list.print());

console.log(list.greatest());