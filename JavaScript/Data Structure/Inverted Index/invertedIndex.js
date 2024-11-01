class InvertedIndex {
    constructor() {
        this.index = {};
    }

    addDocument(doc) {
        const words = doc.Text.toLowerCase().split(' ');

        for(let i = 0; i < words.length; i++) {
            if(!this.index[words[i]]) {
                this.index[words[i]] = [];
            }
            if(!words[i].includes(doc.ID)) {
                this.index[words[i]].push(doc.ID);
            }
        }
    }

    
}

const invertedIndex = new InvertedIndex();

const docs = [
    {ID: 1, Text: "The quick brown fox"},
	{ID: 2, Text: "The quick blue fox"},
	{ID: 3, Text: "The fast red fox"}
];

for(let i = 0; i < docs.length; i++) {
    invertedIndex.addDocument(docs[i]);
}

console.log(invertedIndex.index);