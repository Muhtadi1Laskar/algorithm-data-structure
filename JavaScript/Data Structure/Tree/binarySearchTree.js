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
        if (!this.root) {
            this.root = new Node(value);
            return;
        } else {
            this._insert(this.root, value);
        }
    }

    _insert(node, value) {
        if (value < node.value) {
            if (!node.left) {
                node.left = new Node(value);
            } else {
                this._insert(node.left, value);
            }
        } else {
            if (!node.right) {
                node.right = new Node(value);
            } else {
                this._insert(node.right, value);
            }
        }
    }

    search(value) {
        if (!this.root) {
            return null;
        }
        let currentNode = this.root;

        while (currentNode) {
            if (value < currentNode.value) {
                currentNode = currentNode.left;
            } else if (value > currentNode.value) {
                currentNode = currentNode.right
            } else if (value === currentNode.value) {
                return currentNode.value;
            } else {
                return null;
            }
        }
    }

    breadthFirstSearch() {
        if (!this.root) {
            return null;
        }
        let currentNode = this.root;
        let list = [];
        let queue = [currentNode];

        while (queue.length > 0) {
            currentNode = queue.pop();
            list.push(currentNode.value);

            if (currentNode.left) {
                queue.push(currentNode.left);
            }
            if (currentNode.right) {
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

    dfsPostOrder() {
        return this.traversePostOrder(this.root, []);
    }

    traverseInOrder(node, list) {
        if (node.left) {
            this.traverseInOrder(node.left, list);
        }

        list.push(node.value);

        if (node.right) {
            this.traverseInOrder(node.right, list);
        }
        return list;
    }

    traversePreOrder(node, list) {
        list.push(node.value);

        if (node.left) {
            this.traverseInOrder(node.left, list);
        }

        if (node.right) {
            this.traverseInOrder(node.right, list);
        }
        return list;
    }

    traversePostOrder(node, list) {
        if (node.left) {
            this.traverseInOrder(node.left, list);
        }

        if (node.right) {
            this.traverseInOrder(node.right, list);
        }

        list.push(node.value);
        return list;
    }

    sums(currentNode = this.root) {
        if (!currentNode) {
            return 0;
        }
        const leftSum = this.sums(currentNode.left);
        const rightSum = this.sums(currentNode.right);

        return currentNode.value + leftSum + rightSum;
    }

    depth(value) {
        return this._depth(this.root, value, 1);
    }

    _depth(node, value, depth) {
        if (!node) {
            return -1;
        }
        if (node.value === value) {
            return depth;
        }
        if (value < node.value) {
            return this._depth(node.left, value, depth + 1);
        } else {
            return this._depth(node.right, value, depth + 1);
        }
    }

    height() {
        return this._height(this.root);
    }

    _height(node) {
        if (!node) {
            return -1;
        }
        const leftBranch = this._height(node.left);
        const rightBranch = this._height(node.right);

        return 1 + Math.max(leftBranch, rightBranch);
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

console.log(bst.depth('Python'));

console.log(bst.height());