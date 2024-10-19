class Node {
    constructor(key, value) {
        this.key = key;
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
    }

    hash(key) {
        return hash(key) % this.size;
    }

    insert(key, value) {
        let currentNode = this.head;
        
        while(currentNode) {
            if(currentNode.key === key) {
                currentNode.value = value;
                return;
            }
            currentNode = currentNode.next;
        }
        let newNode = new Node(key, value);
        newNode.next = this.head;
        this.head = newNode;
    }

    print() {
        const result = [];
        let currentNode = this.head;

        while(currentNode) {
            result.push([currentNode.key, currentNode.value]);
            currentNode = currentNode.next;
        }
        return result;
    }
}

function hash(key) {
    let hash = 0;
    for (let i = 0; i < key.length; i++) {
        hash = ((hash << 5) - hash) + key.charCodeAt(i);
        hash = hash & 0xffffffff;
    }
    return Math.abs(hash);
}

const list = new LinkedList();

list.insert("Name", "Luffy");
list.insert("Occupation", "Pirate");
list.insert("Rank", "Captain");
list.insert("Devil Fruit User", true);
list.insert("Devil Fruit Name", "Gomu Gomu No Mi");

console.log(list.print());
