class StaticArray {
    constructor(capacity) {
        this.capacity = capacity;
        this.array = new Array(capacity);
        this.len = 0;
    }

    createArray() {
        let idx = 0;

        while (idx < this.capacity) {
            this.array[idx] = idx;
            idx++;
            this.len++;
        }
        return this.array;
    }

    insertItem(index, value) {
        if (index < 0 || index >= this.capacity) {
            return null;
        }
        this.array[index] = value;
        return this.array;
    }

    reset() {
        this.array = new Array(this.capacity);
        return this.array;
    }

    getCapacity() {
        return this.capacity;
    }

    getLength() {
        return this.len;
    }

    print() {
        return this.array;
    }
}

const array = new StaticArray(10);

array.createArray();

console.log(array.array);

array.insertItem(9, 200);

console.log(array.array);

array.reset();

console.log(array.array);