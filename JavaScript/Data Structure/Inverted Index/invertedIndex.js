class InvertedIndex {
    constructor() {
        this.index = {};
    }

    addDocument(doc) {
        const words = doc.Text.toLowerCase().split(' ');

        for (let i = 0; i < words.length; i++) {
            const chars = words[i];

            if (!this.index[chars]) {
                this.index[chars] = [];
            }
            if (!chars.includes(doc.ID)) {
                this.index[chars].push(doc.ID);
            }
        }
    }

    search(words) {
        return this.index.hasOwnProperty(words.toLowerCase()) ?
               this.index[words.toLowerCase()] : [];
    }
}

const invertedIndex = new InvertedIndex();

const docs = [
    { ID: 1, Text: "The quick brown fox" },
    { ID: 2, Text: "The quick blue fox" },
    { ID: 3, Text: "The fast red fox" }
];

for (let i = 0; i < docs.length; i++) {
    invertedIndex.addDocument(docs[i]);
}

console.log("Documents containing 'quick':", invertedIndex.search("quick"))
console.log("Documents containing 'fox':", invertedIndex.search("fox"))
console.log("Documents containing 'fast':", invertedIndex.search("fast"))
console.log("Documents containing 'elephant':", invertedIndex.search("elephant"))