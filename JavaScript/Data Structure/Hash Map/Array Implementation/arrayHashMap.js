class HashMap {
    constructor(size=10) {
        this.size = size;
        this.array = Array.from({ length: size }, () => []);
    }

    static hash(key) {
        let hash = 0;
        for (let i = 0; i < key.length; i++) {
            hash = ((hash << 5) - hash) + key.charCodeAt(i);
            hash = hash & 0xffffffff;
        }
        return Math.abs(hash);
    }

    set(key, value) {
        const hashedKey = HashMap.hash(key);
        const index = hashedKey % this.size;

        for(let i = 0; i < this.array[index].length; i++) {
            if(this.array[index][i] === key) {
                this.array[index][i] = [key, value];
                return this;
            }
        }
        this.array[index].push([key, value]);
        return this;
    }

    get(key) {
        const hashedKey = HashMap.hash(key);
        let index = hashedKey % this.size;

        for(let i = 0; i < this.array[index].length; i++) {
            if(this.array[index][i][0] == key) {
                return this.array[index][i][1];
            }
        }
        return null;
    }
}

const hashMap = new HashMap(10);

const data = [
    ['Name', 'Luffy'],
    ['Occupation', 'Pirate'],
    ['Age', 20],
    ['Favourite Food', 'Meat'],
    ['Devil Fruit User', true], 
    ['Devil Fruit Name', "Gomu Gomu No Mi"]
];

for (let i = 0; i < data.length; i++) {
    const [key, value] = data[i];
    hashMap.set(key, value);
}

for (let i = 0; i < data.length; i++) {
    const [key, value] = data[i];
    console.log(hashMap.get(key));
}

console.log(hashMap.array);