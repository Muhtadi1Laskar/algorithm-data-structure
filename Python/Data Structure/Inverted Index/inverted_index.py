class InvertedIndex:
    def __init__(self):
        self.index = {}
    
    def add_document(self, doc):
        words = doc['Text'].lower().split(" ")

        for char in words:
            if char not in self.index:
                self.index[char] = []
            if doc['ID'] not in self.index[char]:
                self.index[char].append(doc['ID'])
    
    def search(self, word):
        return self.index.get(word.lower(), [])

    

inverted_index = InvertedIndex()

docs = [
    {'ID': 1, 'Text': "The quick brown fox"},
	{'ID': 2, 'Text': "The quick blue fox"},
	{'ID': 3, 'Text': "The fast red fox"},
]

for item in docs:
    inverted_index.add_document(item)

print("Documents containing 'quick':", inverted_index.search("quick"))
print("Documents containing 'fox':", inverted_index.search("fox"))
print("Documents containing 'fast':", inverted_index.search("fast"))
print("Documents containing 'elephant':", inverted_index.search("elephant"))