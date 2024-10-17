class HashMap {
    constructor(size=10) {
        this.size = size;
        this.array = new Array(size).fill([]);
    }
}

const hashMap = new HashMap(5);

console.log(hashMap.array);