import hashlib

class MerkleTree:
    def __init__(self, value):
        self.leaves = [self.hash_data(leave) for leave in value]
        self.root = self.build_tree(self.leaves)
    
    def hash_data(self, data):
        return hashlib.sha256(data.encode('utf-8')).hexdigest()
    
    def build_tree(self, leaves):
        if not leaves:
            return None
        
        current_level = leaves[:]
        
        while len(current_level) > 1:
            if len(current_level) % 2 != 0:
                current_level.append(current_level[-1])
            
            next_level = []
            for i in range(0, len(current_level), 2):
                parent_hash = self.hash_data(current_level[i] + current_level[i+1])
                next_level.append(parent_hash)
            current_level = next_level
        
        return current_level[0]
    
    def get_root(self):
        return self.root

data = ['C', 'JavaScript', 'Python', 'Haskell', 'Go', 'Odin']

merkle_tree = MerkleTree(data)

print(merkle_tree.root)