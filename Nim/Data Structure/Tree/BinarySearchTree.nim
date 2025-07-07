type
    Node = ref object
        left: Node
        right: Node
        value: string

type
    BinarySearchTree = ref object
        root: Node
        insertion_order: seq[seq[string]]

proc new_bst(): BinarySearchTree =
    return BinarySearchTree(root: nil, insertion_order: @[@[]])

proc insert(bst: BinarySearchTree, node: Node, value: string) = 
    if value.len < node.value.len:
        if node.left.isNil:
            node.left = Node(value: value)
            bst.insertion_order.add(@[value, "left"]) # This keeps track of item insertion order
        else:
            bst.insert(node.left, value)
    else:
        if node.right.isNil:
            node.right = Node(value: value)
            bst.insertion_order.add(@[value, "right"]) # This keeps track of item insertion order
        else:
            bst.insert(node.right, value)

proc Insert(bst: BinarySearchTree, value: string) = 
    if bst.root.isNil:
        bst.root = Node(value: value)
        bst.insertion_order.add(@[value, "root"]) # This keeps track of item insertion order
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

proc traversal(bst: BinarySearchTree, node: Node = bst.root, visited_area: string = "root") = 
    if not node.isNil:
        bst.traversal(node.left, "left")
        echo "Value: " & node.value & " | Node Position: " & visited_area
        bst.traversal(node.right, "right") 

proc traverse_in_insertion_order(bst: BinarySearchTree) = 
    for item in bst.insertion_order:
        echo item        

proc breadth_first_search(bst: BinarySearchTree): seq[string] = 
    if bst.root.isNil:
        echo "The tree is empty"
        return @[]

    var list: seq[string] = @[]
    var queue: seq[Node] = @[bst.root]

    while queue.len > 0:
        var current_node = queue[0]
        queue = queue[1 ..< queue.len]
        list.add(current_node.value)

        if not current_node.left.isNil:     
            queue.add(current_node.left)
        if not current_node.right.isNil:
            queue.add(current_node.right)
    
    return list

proc traverse_in_order(bst: BinarySearchTree, node: Node, list: var seq[string]): seq[string] = 
    if node.isNil:
        return list
    discard bst.traverse_in_order(node.left, list)
    list.add(node.value)
    discard bst.traverse_in_order(node.right, list)
    return list

proc traverse_pre_order(bst: BinarySearchTree, node: Node, list: var seq[string]): seq[string] = 
    if node.isNil:
        return list
    list.add(node.value)
    discard bst.traverse_pre_order(node.left, list)
    discard bst.traverse_pre_order(node.right, list)
    return list

proc traverse_post_order(bst: BinarySearchTree, node: Node, list: var seq[string]): seq[string] = 
    if node.isNil:
        return list
    discard bst.traverse_post_order(node.left, list)
    discard bst.traverse_post_order(node.right, list)
    list.add(node.value)
    return list

proc depth_first_search(bst: BinarySearchTree, traverse_type: string): seq[string] = 
    var list: seq[string] = @[]

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

when isMainModule:
    let bst = new_bst()

    bst.Insert("C")
    bst.Insert("JavaScript")
    bst.Insert("Python")
    bst.Insert("Odin")
    bst.Insert("Haskell")
    bst.Insert("Machine Code")
    bst.Insert("Nim")
    bst.Insert("Ruby")

    echo bst.search("Python"), "\n"

    echo " "
    bst.traversal()

    echo " "
    bst.traverse_in_insertion_order()

    echo " "
    echo bst.breadth_first_search()

    echo bst.depth_first_search("in order"), "\n"
    echo bst.depth_first_search("pre order"), "\n"
    echo bst.depth_first_search("post order"), "\n"
