type
    Node = ref object
        left: Node
        right: Node
        value: string
    
type 
    BinarySearchTree = ref object
        root: Node
    

proc new_bst(): BinarySearchTree = 
    return BinarySearchTree(root: nil)

proc insertHelper(bst: BinarySearchTree, node: Node, value: string) = 
    if value < node.value:
        if node.left.isNil:
            node.left = Node(value: value)
        else:
            bst.insertHelper(node.left, value)
    else:
        if node.right.isNil:
            node.right = Node(value: value)
        else:
            bst.insertHelper(node.right, value)
    

proc insert(bst: BinarySearchTree, value: string) = 
    if bst.root.isNil:
        bst.root = Node(value: value)
        return
    else:
        bst.insertHelper(bst.root, value)

proc traversal(bst: BinarySearchTree) = 
    proc walk(node: Node) = 
        if not node.isNil:
            walk(node.left)
            echo node.value
            walk(node.right) 
        
    walk(bst.root)

proc search(bst: BinarySearchTree, value: string): string = 
    var currentNode: Node = bst.root

    while not currentNode.isNil:
        if value < currentNode.value:
            currentNode = currentNode.left
        elif value > currentNode.value:
            currentNode = currentNode.right
        else:
            return currentNode.value
    return "The item is not available in the tree"



when isMainModule:
    var bst: BinarySearchTree = new_bst()

    bst.insert("C")
    bst.insert("JavaScript")
    bst.insert("Python")
    bst.insert("Odin")
    bst.insert("Haskell")
    bst.insert("Zig")
    bst.insert("Machine Code")
    bst.insert("Nim")
    bst.insert("Ruby")

    bst.traversal()

    echo ""
    echo bst.search("Nim")

