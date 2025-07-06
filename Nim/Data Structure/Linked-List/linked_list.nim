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

proc search(bst: BinarySearchTree, value: string): string = 
    var current_node = bst.root
    while not current_node.isNil:
        if value.len < current_node.value.len:
            current_node = current_node.left
        elif value.len > current_node.value.len:
            current_node = current_node.right
        else:
            return current_node.value
    
    return "No data found"
                

when isMainModule:
    let bst = new_bst()

    bst.Insert("C")
    bst.Insert("JavaScript")
    bst.Insert("Python")
    bst.Insert("Odin")
    bst.Insert("Haskell")
    bst.Insert("Machine Code")

    echo bst.search("Python")
