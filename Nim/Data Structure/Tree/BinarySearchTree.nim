import strutils

type
    Node = ref object
        left: Node
        right: Node
        value: string

type
    BinarySearchTree = ref object
        root: Node

proc new_bst(): BinarySearchTree =
    return BinarySearchTree(root: Node(left: nil, right: nil))

proc insert(bst: BinarySearchTree, node: Node, value: string) = 
    if value.len < node.value.len:
        if node.left.isNil:
            node.left = Node(value: value)
        else:
            bst.insert(node.left, value)
    else:
        if node.right.isNil:
            node.right = Node(value: value)
        else:
            bst.insert(node.right, value)

proc Insert(bst: BinarySearchTree, value: string) = 
    if bst.root.isNil:
        bst.root = Node(value: value)
    else:
        bst.insert(bst.root, value)

when isMainModule:
    let bst = BinarySearchTree()

    bst.Insert("C")
    bst.Insert("JavaScript")
    bst.Insert("Python")
    bst.Insert("Odin")
    bst.Insert("Haskell")
    bst.Insert("Machine Code")

    echo bst.root.right.value
