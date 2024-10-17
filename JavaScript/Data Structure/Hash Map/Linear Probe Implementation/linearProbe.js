import crypto from "crypto"

class HashMap {
    constructor(size=10) {
        this.size = size;
        this.array = new Array(size).fill([]);
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
        const hashedKey = HashMap.hash(key)

        return hashedKey
    }
}

const hashMap = new HashMap();

console.log(hashMap.set("Name", "Luffy"));