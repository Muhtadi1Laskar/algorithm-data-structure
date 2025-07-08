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

proc insert[T](bst: BinarySearchTree[T], value: T) = 
    if bst.root.isNil:
        bst.root = Node[T](value: value)
    else:
        bst.insert_helper(bst.root, value)

proc search[T](bst: BinarySearchTree[T], value: T): T = 
    var current_node = bst.root

    while not current_node.isNil:
        if value < current_node.value:
            current_node = current_node.left
        elif value > current_node.value:
            current_node = current_node.right
        else:
            return current_node.value

proc traversal[T](bst: BinarySearchTree[T], node: Node[T] = bst.root) = 
    if not node.isNil:
        bst.traversal(node.left)
        echo node.value
        bst.traversal(node.right)

proc breadth_first_search[T](bst: BinarySearchTree[T]): seq[T] = 
    if bst.root.isNil:
        echo "The tree is empty"
        return @[]
    var list: seq[T] = @[]
    var queue: seq[Node[T]] = @[bst.root]

    while queue.len > 0:
        var current_node = queue[0]
        queue = queue[1 ..< queue.len]
        list.add(current_node.value)

        if not current_node.left.isNil:
            queue.add(current_node.left)
        if not current_node.right.isNil:
            queue.add(current_node.right)
    
    return list

when isMainModule:
    let bst = new_bst[string]()

    bst.insert("C")
    bst.insert("JavaScript")
    bst.insert("Python")
    bst.insert("Odin")
    bst.insert("Haskell")
    bst.insert("Machine Code")
    bst.insert("Nim")
    bst.insert("Ruby")

    # for i in 0 ..< 10:
    #     bst.insert(i)

    bst.traversal(bst.root)

    echo " "
    echo bst.search("Odin")

    echo " "
    echo bst.breadth_first_search()