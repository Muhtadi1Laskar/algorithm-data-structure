import crypto from 'crypto';


class Node {
  constructor(left, right, value, content, isCopied = false) {
    this.left = left;
    this.right = right;
    this.value = value;
    this.content = content;
    this.isCopied = isCopied;
  }

  static hash(data) {
    if (typeof data !== 'string') {
      data = data.toString();
    }
    return crypto.createHash('sha256').update(data, 'utf-8').digest('hex');
  }

  copy() {
    return new Node(this.left, this.right, this.value, this.content, true);
  }
}

class MerkleTree {
  constructor(values) {
    this.__buildTree(values);
  }

  __buildTree(values) {
    const leaves = values.map(e => new Node(null, null, Node.hash(e), e));

    if (leaves.length % 2 !== 0) {
      leaves.push(leaves[leaves.length - 1].copy());
    }
    this.root = this.__buildTreeRec(leaves);
  }

  __buildTreeRec(nodes) {
    if (nodes.length % 2 !== 0) {
      nodes.push(nodes[nodes.length - 1].copy());
    }
    let half = Math.floor(nodes.length / 2);

    if (nodes.length === 2) {
      let value = Node.hash(nodes[0].value + nodes[1].value);
      let content = `${nodes[0].content} + ${nodes[1].content}`;
      return new Node(nodes[0], nodes[1], value, content);
    }

    let left = this.__buildTreeRec(nodes.slice(0, half));
    let right = this.__buildTreeRec(nodes.slice(half));
    let value = Node.hash(left.value + right.value);
    let content = `${left.content} + ${right.content}`;

    return new Node(left, right, value, content);
  }

  get_root() {
    return this.root.value;
  }
}

const array = ["C", "JavaScript", "Python", "Haskell", "Go", "Odin"];

const tree = new MerkleTree(array);

console.log(tree.get_root());