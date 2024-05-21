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

    breadthFirstSearch() {
        if(!this.root) {
            return null;
        }
        let currentNode = this.root;
        let list = [];
        let queue = [currentNode];

        while(queue.length > 0) {
            currentNode = queue.pop();
            list.push(currentNode.value);

            if(currentNode.left) {
                queue.push(currentNode.left);
            }
            if(currentNode.right) {
                queue.push(currentNode.right);
            }
        }
        return list;
    }

    dfsInOrder() {
        return this.traverseInOrder(this.root, []);
    }

    dfsPreOrder() {
        return this.traversePreOrder(this.root, []);
    }

    traverseInOrder(node, list) {
        if(node.left) {
            this.traverseInOrder(node.left, list);
        }
        
        list.push(node.value);

        if(node.right) {
            this.traverseInOrder(node.right, list);
        }
        return list;
    }

    traversePreOrder(node, list) {
        list.push(node.value);

        if(node.left) {
            this.traverseInOrder(node.left, list);
        }
        
        if(node.right) {
            this.traverseInOrder(node.right, list);
        }
        return list;
    }

}

const bst = new BinarySearchTree();

bst.insert('C');
bst.insert('JavaScript');
bst.insert('Python');
bst.insert('Odin');
bst.insert('Haskell');

console.log(bst);

console.log(bst.breadthFirstSearch());
console.log(bst.dfsInOrder());
