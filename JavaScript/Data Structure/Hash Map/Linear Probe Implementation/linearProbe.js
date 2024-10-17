class HashMap {
    constructor(size = 10) {
        this.size = size;
        this.array = new Array(size).fill(null);
    }

    static hash(key) {
        let hash = 0;
        for (let i = 0; i < key.length; i++) {
            hash = ((hash << 5) - hash) + key.charCodeAt(i);
            hash = hash & hash;
        }
        return hash;
    }

    set(key, value) {
        const hashedKey = HashMap.hash(key);
        let index = hashedKey % this.size;

        while (this.array[index] !== null) {
            index = (index + 1) % this.size;
        }

        this.array[index] = [key, value];
    }
}

const hashMap = new HashMap();

const data = [
    ['Name', 'Luffy'],
    ['Occupation', 'Pirate'],
    ['Age', 20],
    ['Favourite Food', 'Meat'],
    ['Devil Fruit User', true]
];

for (let i = 0; i < data.length; i++) {
    const [key, value] = data[i];
    hashMap.set(key, value);
}

console.log(hashMap.array);