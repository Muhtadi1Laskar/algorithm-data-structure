import hashlib

class Node:
    def __init__(self, left, right, value, content, is_copied=False):
        self.left = left
        self.right = right
        self.value = value
        self.content = content
        self.is_copied = is_copied
    
    def hash(value):
        return hashlib.sha256(value.encode('utf08')).hexdigest()

    def __str__(self):
        return str(self.value)

    def copy(self):
        return Node(self.left, self.right, self.value, self.content, True)
    

class MerkleTree:
    def __init__(self, values):
        self.__buildTree(values)
    
    def __buildTree(self, values):
        leaves = [Node(None, None, Node.hash(e), e) for e in values]

        if len(leaves) % 2 != 0:
            leaves.append(leaves[-1].copy())
        
        self.root = self.__buildTreeRec(leaves)