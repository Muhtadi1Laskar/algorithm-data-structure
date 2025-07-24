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


proc insertHelper(node: Node, value: string) = 
    if value < node.value:
        if node.left.isNil:
            var newNode: Node = Node(value: value)
            node.left = newNode
        else:
            insertHelper(node.left, value)
    else:
        if node.right.isNil:
            if node.right.isNil:
                var newNode: Node = Node(value: value)
                node.right = newNode
            else:
                insertHelper(node.right, value)
    

proc insert(bst: BinarySearchTree, value: string) = 
    if bst.root.isNil:
        var newNode: Node = Node(left: nil, right: nil, value: value)
        bst.root = newNode
        return
    else:
        insertHelper(bst.root, value)


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

    echo bst.root.value

