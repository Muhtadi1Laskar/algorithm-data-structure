import std/[tables, sequtils]

type 
    Contact = ref object
        name: string
        number: int

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
    if value.name < node.value.name:
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

proc search[T](bst: BinarySearchTree[T], value: T): Table[string, int] = 
    var current_node = bst.root
    var result: Table[string, int] = initTable[string, int]()

    while not current_node.isNil:
        if value.name < current_node.value.name:
            current_node = current_node.left
        elif value.name > current_node.value.name:
            current_node = current_node.right
        else:
            result[current_node.value.name] = current_node.value.number 
            return result

proc traversal[T](bst: BinarySearchTree[T], node: Node[T] = bst.root) = 
    if not node.isNil:
        bst.traversal(node.left)
        echo $node.value.name & " " & $node.value.number
        bst.traversal(node.right)

proc breadth_first_search[T](bst: BinarySearchTree[T]): seq[Contact] = 
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

when isMainModule:
    let bst = new_bst[Contact]()

    bst.insert(Contact(name: "Luffy", number: 01775900737))
    bst.insert(Contact(name: "Zoro", number: 01866758443))
    bst.insert(Contact(name: "Name", number: 01775900737))
    bst.insert(Contact(name: "Sanji", number: 01775900737))
    bst.insert(Contact(name: "Usopp", number: 01775900737))
    bst.insert(Contact(name: "Chopper", number: 01775900737))
    bst.insert(Contact(name: "Robin", number: 01775900737))
    bst.insert(Contact(name: "Franky", number: 01775900737))

    # bst.traversal(bst.root)

    echo " "
    echo bst.search(Contact(name: "Luffy"))

    echo " "
    # for i in bst.breadth_first_search():
    #     echo i.name & " " & $i.number


    echo bst.depth_first_search("in order").mapIt((it.number, it.name)), "\n"
    echo bst.depth_first_search("pre order").mapIt((it.number, it.name)), "\n"
    echo bst.depth_first_search("post order").mapIt((it.number, it.name)), "\n"