class Node {
    constructor(value) {
        this.left = null;
        this.right = null;
        this.value = value;
    }
}

class BinarySearchTree {
    constructor() {
        this.root = null;
    }

    insert(value) {
        let newNode = new Node(value);

        if (!this.root) {
            this.root = newNode;
            return;
        }
        let currentNode = this.root;

        while (true) {
            if (value < currentNode.value) {
                if (!currentNode.left) {
                    currentNode.left = newNode;
                    return;
                }
                currentNode = currentNode.left;
            } else {
                if (!currentNode.right) {
                    currentNode.right = newNode
                    return;
                }
                currentNode = currentNode.right;
            }
        }
    }

    search(value) {
        if(!this.root) {
            return null;
        }
        let currentNode = this.root;

        while(currentNode) {
            if(value < currentNode.value) {
                currentNode = currentNode.left;
            }
            else if(value > currentNode.value) {
                currentNode = currentNode.right
            }
            else if(value === currentNode.value) {
                return currentNode.value;
            }
            else {
                return null;
            }
        }
    }

}

const bst = new BinarySearchTree();

bst.insert('C');
bst.insert('JavaScript');
bst.insert('Python');
bst.insert('Odin');
bst.insert('Haskell');

console.log(bst);

console.log(bst.search('Python'));
