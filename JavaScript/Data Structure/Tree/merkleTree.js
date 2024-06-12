import crypto from 'crypto';

class Node {
  constructor(left, right, value, content, isCopied=false) {
    this.left = left;
    this.right = right;
    this.value = value;
    this.content = content;
    this.isCopied = isCopied;
  }

  hash(value) {
    if(typeof data !== 'string') {
      data = data.toString();
    }
    const hash = crypto.createHash('sha256');
    hash.update(data);
    return hash.digest('hex');
  }

  copy() {
    return new Node(this.left, this.right, this.value, this.content, true);
  }
}


