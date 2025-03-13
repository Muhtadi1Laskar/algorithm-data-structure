class DynamicArray {
    constructor(capacity) {
        this.capacity = capacity;
        this.array = new Array(capacity);
        this.len = 0;
    }

    pushBack(value) {
        if (this.len === this.capacity) {
            this.resize();
        }
        this.array[this.len] = value;
        this.len++;
    }

    resize() {
        this.capacity = 2 * this.capacity;
        const newArray = new Array(this.capacity);

        for (let i = 0; i < this.len; i++) {
            newArray[i] = this.array[i];
        }
        this.array = newArray;
    }

    get(index) {
        if (index >= this.len || index < -1) {
            return "Index out of range";
        }
        return this.array[index];
    }

    insert(index, value) {
        if (index > this.len || index < -1) {
            return "Index out of range";
        }
        if (this.len === this.capacity) {
            this.resize();
        }

        this.len++;

        for (let i = this.len - 1; i > index - 1; i--) {
            this.array[i] = this.array[i - 1];
        }
        this.array[index] = value;
    }

    popBack() {
        const item = array[this.len];
        this.array[this.len - 1] = 0
        this.len--;
        return item;
    }

    popFront() {
        if (this.len === 0) {
            return "The array is empty";
        }

        const item = array[0];

        for (let i = 1; i < this.len; i++) {
            this.array[i - 1] = this.array[i];
        }
        this.array[this.len - 1] = 0;
        this.len--;

        return item;
    }
}

const array = new DynamicArray(3);

array.pushBack(1);
array.pushBack(2);
array.pushBack(3);

// console.log(array.array);
// console.log(array.capacity);
// console.log(array.len);

array.pushBack(4);
array.pushBack(5);
array.pushBack(6);
array.pushBack(7);

console.log(array.array);

array.insert(2, 200);

console.log(array.array);

// console.log(array.array);
// console.log(array.capacity);
// console.log(array.len);

// console.log(array.get(7));

// console.log(array.array);

// array.popBack();
// array.popBack();
// array.popBack();

// array.pushBack(10)

// console.log(array.array);

// console.log(array.array);

// array.popFront();

// console.log(array.array);
