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

    def traverse_in_order(self, node, list):
        if node.left:
            self.traverse_in_order(node.left, list)

        list.append(node.value)

        if node.right:
            self.traverse_in_order(node.right, list)
        return list

    def traverse_in_preorder(self, node, list):
        list.append(node.value)

        if node.left:
            self.traverse_in_preorder(node.left, list)

        if node.right:
            self.traverse_in_preorder(node.right, list)

        return list   

    def DFS_in_order(self):
        return self.traverse_in_order(self.root, [])

    def DFS_in_preorder(self):
        return self.traverse_in_preorder(self.root, [])
    


bst = BinarySearchTree()

bst.insert('C')
bst.insert('JavaScript')
bst.insert('Python')
bst.insert('Odin')
bst.insert('Haskell')

print(bst.DFS_in_preorder())

print(bst.look_up('Python'))
