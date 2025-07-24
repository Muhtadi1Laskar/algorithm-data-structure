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

proc bfs(bst: BinarySearchTree): seq[string] = 
    if bst.root.isNil:
        echo "The tree is empty"
        return @[]
    var arr: seq[string] = @[]
    var queue: seq[Node] = @[bst.root]

    while queue.len > 0:
        var currentNode: Node = queue[0]
        queue = queue[1 ..< queue.len]
        arr.add(currentNode.value)

        if not currentNode.left.isNil:
            queue.add(currentNode.left)
        if not currentNode.right.isNil:
            queue.add(currentNode.right)
    return arr

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

    echo bst.bfs()

