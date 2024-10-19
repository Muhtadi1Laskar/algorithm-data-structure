import crypto from 'crypto';

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

    find(key) {
        let currentNode = this.head;

        while(currentNode) {
            if(currentNode.key === key) {
                return currentNode.value;
            }
            currentNode = currentNode.next;
        }
        return null;
    }

    delete(key) {
        let currentNode = this.head;
        let prev = null;

        while(currentNode) {
            if(currentNode.key === key) {
                if(prev) {
                    prev.next = currentNode.next;
                } else {
                    this.head = currentNode.next;
                }
            }
            prev = currentNode;
            currentNode = currentNode.next;
        }
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

class HashMap {
    constructor(size=10) {
        this.size = size;
        this.array = Array.from({ length: size }, () => new LinkedList())
    }

    hash(key) {
        return hash(key) % this.size;
    }

    set(key, value) {
        const index = this.hash(key);
        this.array[index].insert(key, value);
    }

    get(key) {
        const index = this.hash(key);
        return this.array[index].find(key);
    }

    print() {
        for(let i = 0; i < this.array.length; i++) {
            let currentNode = this.array[i].head;

            process.stdout.write(`Bucket ${i}: `);
            while(currentNode) {
                process.stdout.write(`(${currentNode.key}: ${currentNode.value}) -> `);
                currentNode = currentNode.next;
            }
            console.log("None");
        }
    }
}

function hash(key) {
    const hash = crypto.createHash('sha256');
    hash.update(key.toString());
    const hashedKey = hash.digest('hex');
    return parseInt(hashedKey.slice(0, 8), 16);
}


const hashMap = new HashMap(10);

const data = [
    ['Name', 'Luffy'],
    ['Occupation', 'Pirate'],
    ['Age', 20],
    ['Favourite Food', 'Meat'],
    ['Devil Fruit User', true], 
    ['Devil Fruit Name', "Gomu Gomu No Mi"]
];

for (let i = 0; i < data.length; i++) {
    const [key, value] = data[i];
    hashMap.set(key, value);
}


hashMap.print();

for(let i = 0; i < data.length; i++) {
    const [key] = data[i];
    console.log(hashMap.get(key));
}

