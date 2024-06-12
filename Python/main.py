from typing import List, Optional
import hashlib

class Node:
    def __init__(self, left: Optional['Node'], right: Optional['Node'], value: str, content: str, is_copied=False) -> None:
        self.left: Optional[Node] = left
        self.right: Optional[Node] = right
        self.value = value
        self.content = content
        self.is_copied = is_copied

    @staticmethod
    def hash(val: str) -> str:
        return hashlib.sha256(val.encode('utf-8')).hexdigest()

    def __str__(self):
        return str(self.value)

    def copy(self):
        """
        class copy function
        """
        return Node(self.left, self.right, self.value, self.content, True)

class MerkleTree:
    def __init__(self, values: List[str]) -> None:
        if not values:
            raise ValueError("The list of values cannot be empty.")
        self.__buildTree(values)

    def __buildTree(self, values: List[str]) -> None:
        leaves: List[Node] = [Node(None, None, Node.hash(e), e) for e in values]
        if len(leaves) % 2 == 1:
            leaves.append(leaves[-1].copy())
        self.root: Node = self.__buildTreeRec(leaves)

    def __buildTreeRec(self, nodes: List[Node]) -> Node:
        if len(nodes) % 2 == 1:
            nodes.append(nodes[-1].copy())
        half: int = len(nodes) // 2

        if len(nodes) == 2:
            value = Node.hash(nodes[0].value + nodes[1].value)
            content = f"{nodes[0].content} + {nodes[1].content}"

            return Node(nodes[0], nodes[1], value, content)

        left: Node = self.__buildTreeRec(nodes[:half])
        right: Node = self.__buildTreeRec(nodes[half:])
        value: str = Node.hash(left.value + right.value)
        content: str = f'{left.content}+{right.content}'
        return Node(left, right, value, content)

    def printTree(self) -> None:
        self.__printTreeRec(self.root)

    def __printTreeRec(self, node: Node) -> None:
        if node is not None:
            if node.left is not None:
                print("Left: " + str(node.left))
                print("Right: " + str(node.right))
            else:
                print("Input")

            if node.is_copied:
                print('(Padding)')
            print("Value: " + str(node.value))
            print("Content: " + str(node.content))
            print("")
            self.__printTreeRec(node.left)
            self.__printTreeRec(node.right)

    def getRootHash(self) -> str:
        return self.root.value

# Example usage
values = ['C', 'JavaScript', 'Python', 'Haskell', 'Go', 'Odin']
merkle_tree = MerkleTree(values)
print("Merkle Root:", merkle_tree.getRootHash())
merkle_tree.printTree()
