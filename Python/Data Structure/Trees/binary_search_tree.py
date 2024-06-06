class Node:
    def __init__(self, value) -> None:
        self.left = None
        self.right = None
        self.value = value


class BinarySearchTree:
    def __init__(self) -> None:
        self.root = None
    
    def insert(self, value) -> None:
        if self.root is None:
            self.root = Node(value)
            return 
        else:
            self._insert(self.root, value)
        return 
    
    def _insert(self, node, value):
        if value < node.value:
            if node.left is None:
                node.left = Node(value)
            else:
                self._insert(node.left, value)
        else:
            if node.right is None:
                node.right = Node(value)
            else:
                self._insert(node.right, value)
    
    def look_up(self, value):
        if not self.root:
            return None
        current_node = self.root

        while current_node:
            if value < current_node.value:
                current_node = current_node.left
            elif value > current_node.value:
                current_node = current_node.right
            elif value == current_node.value:
                return current_node.value
            else:
                return False
    
    def breadth_first_search(self):
        if not self.root:
            return
        
        current_node = self.root
        li = []
        queue = [current_node]

        while queue:
            current_node = queue.pop()
            li.append(current_node.value)

            if current_node.left:
                queue.append(current_node.left)
            if current_node.right:
                queue.append(current_node.right)

        return li
    
    def inorder(self):
        return self._inorder(self.root)
    
    def _inorder(self, node):
        li = []
        if node is not None:
            li += self._inorder(node.left)
            li.append(node.value)
            li += self._inorder(node.right)
        return li
    
    def preorder(self):
        return self._preorder(self.root)
    
    def _preorder(self, node):
        li = []
        if node is not None:
            li.append(node.value)
            li += self._inorder(node.left)
            li += self._inorder(node.right)
        return li
    
    def postorder(self):
        return self._postorder(self.root)
    
    def _postorder(self, node):
        li = []
        if node is not None:
            li += self._postorder(node.left)
            li += self._postorder(node.right)
            li.append(node.value)
        return li
    
    def sums(self, current_node):
        if current_node is None:
            return 0
        
        leftSum = self.sums(current_node.left)
        rightSum = self.sums(current_node.right)

        return current_node.value + leftSum + rightSum


bst = BinarySearchTree()

bst.insert('C')
bst.insert('JavaScript')
bst.insert('Python')
bst.insert('Odin')
bst.insert('Haskell')

print(bst.preorder())

print(bst.look_up('Python