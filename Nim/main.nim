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
