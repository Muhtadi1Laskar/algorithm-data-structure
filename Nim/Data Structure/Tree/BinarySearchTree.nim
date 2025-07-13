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
    var current_node: Node[system.string] = bst.root

    while not current_node.isNil:
        if value < current_node.value:
            current_node = current_node.left
        elif value > current_node.value:
            current_node = current_node.right
        else:
            return current_node.value

proc traversal[T](bst: BinarySearchTree[T]) = 
    proc walk(node: Node[T]) = 
        if not node.isNil:
            walk(node.left)
            echo node.value 
            walk(node.right)
    walk(bst.root)

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

proc traverse_in_order[T](bst: BinarySearchTree[T], node: Node[T], list: var seq[T]): seq[T] = 
    if node.isNil:
        return list
    discard bst.traverse_in_order(node.left, list)
    list.add(node.value)
    discard bst.traverse_in_order(node.right, list)
    return list

proc traverse_pre_order[T](bst: BinarySearchTree[T], node: Node[T], list: var seq[T]): seq[T] =  
    if node.isNil:
        return list
    list.add(node.value)
    discard bst.traverse_pre_order(node.left, list)
    discard bst.traverse_pre_order(node.right, list)
    return list

proc traverse_post_order[T](bst: BinarySearchTree[T], node: Node[T], list: var seq[T]): seq[T] =
    if node.isNil:
        return list
    discard bst.traverse_post_order(node.left, list)
    discard bst.traverse_post_order(node.right, list)
    list.add(node.value)
    return list

proc depth_first_search[T](bst: BinarySearchTree[T], traverse_type: string): seq[T] = 
    var list: seq[T] = @[]

    case traverse_type:
    of "in order":
        return bst.traverse_in_order(bst.root, list)
    of "pre order":
        return bst.traverse_pre_order(bst.root, list)
    of "post order":
        return bst.traverse_post_order(bst.root, list)
    else:
        echo "Invalid order name"
        return @[]

proc iterative_dfs[T](bst: BinarySearchTree[T]): seq[T] = 
    var result: seq[T] = @[]
    var stack: seq[Node[T]] = @[]
    var current_node = bst.root

    while not current_node.isNil or stack.len > 0:
        while not current_node.isNil:
            stack.add(current_node)
            current_node = current_node.left
        current_node = stack.pop()
        result.add(current_node.value)

        current_node = current_node.right
    return result

when isMainModule:
    let bst = new_bst[string]()

    bst.insert("C")
    bst.insert("JavaScript")
    bst.insert("Python")
    bst.insert("Odin")
    bst.insert("Haskell")
    bst.insert("Zig")
    bst.insert("Machine Code")
    bst.insert("Nim")
    bst.insert("Ruby")

    # for i in 0 ..< 10:
    #     bst.insert(i)

    bst.traversal()

    echo " "
    echo bst.search("Odin")

    echo " "
    echo bst.breadth_first_search()


    echo bst.depth_first_search("in order"), "\n"
    echo bst.depth_first_search("pre order"), "\n"
    echo bst.depth_first_search("post order"), "\n"

    echo bst.iterative_dfs()