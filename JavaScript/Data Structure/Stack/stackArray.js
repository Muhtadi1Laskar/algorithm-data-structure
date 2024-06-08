class Stack {
    constructor(size) {
        this.size = size;
        this.top = -1;
        this.stack = new Array(this.size);
    }

    push(value) {
        if(this.top == this.size-1) {
            this.resize();
        }
        this.top++;
        this.stack[this.top] = value;
    }

    resize() {
        const oldSize = this.size;
        this.size *= 2;
        const newStack = new Array(this.size);

        for(let i=0;i<oldSize;i++) {
            newStack[i] = this.stack[i];
        }
        this.stack = newStack;
    }

    print() {
        return this.stack;
    }
}

const stack = new Stack(5);

stack.push(1);
stack.push(2);
stack.push(3);
stack.push(4);
stack.push(5);

console.log(stack.print());

stack.push(6);
stack.push(7);
stack.push(8);
stack.push(9);
stack.push(10);

console.log(stack.print());