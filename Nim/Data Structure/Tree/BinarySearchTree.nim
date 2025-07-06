type
    Node = ref object
        left: Node
        right: Node
        value: string

type
    BinarySearchTree = ref object
        root Node


proc new_bst() BinarySearchTree =
    return BinarySearchTree()
