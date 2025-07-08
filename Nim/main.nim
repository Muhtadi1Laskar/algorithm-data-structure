type
    Node[T] = ref object
        left: Node[T]
        right: Node[T]
        value: T

type 
    BinarySearchTree[T] = ref object
        root: Node[T]

proc new_bst[T](): BinarySearchTree[T] = 
    return BinarySearchTree[T](root: nil)

proc insert_helper[T](bst: BinarySearchTree[T], node: Node[T], value: T) = 
    if value < node.value:
        if node.left.isNil:
            node.left = Node[T](value: value)
        else:
            bst.insert_helper(node.left, value)
    else:
        if node.right.isNil:
            node.right = Node[T](value: value)
        else:
            bst.insert_helper(node.right, value)

proc Insert[T](bst: BinarySearchTree[T], value: T) = 
    if bst.root.isNil:
        bst.root = Node[T](value: value)
    else:
        bst.insert_helper(bst.root, value)

proc traversal[T](bst: BinarySearchTree[T], node: Node[T] = bst.root) = 
    if not node.isNil:
        bst.traversal(node.left)
        echo node.value
        bst.traversal(node.right)

when isMainModule:
    let bst = new_bst[string]()

    bst.Insert("C")
    bst.Insert("JavaScript")
    bst.Insert("Python")
    bst.Insert("Odin")
    bst.Insert("Haskell")
    bst.Insert("Machine Code")
    bst.Insert("Nim")
    bst.Insert("Ruby")

    bst.traversal(bst.root)