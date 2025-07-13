type 
    Node[T] = ref object
        value: T
        next: Node[T]

type 
    Stack[T] = ref object
        top: Node[T]
        length: int


proc new_stack[T](): Stack[T] = 
    return Stack[T](top: nil, length: 0)

proc add[T](stack: Stack[T], value: T) = 
    var new_node: Node[string] = Node[T](value: value)

    if stack.top.isNil:
        stack.top = new_node
        stack.length += 1
        return

    new_node.next = stack.top
    stack.top = new_node
    stack.length += 1
    return


when isMainModule:
    let stack: Stack[string] = new_stack[string]()

    stack.add("Luffy")
    stack.add("Zoro")
    stack.add("Nami")
    stack.add("Usopp")
    stack.add("Sanji")
    stack.add("Chopper")
    stack.add("Robin")
    stack.add("Franky")
    stack.add("Brook")