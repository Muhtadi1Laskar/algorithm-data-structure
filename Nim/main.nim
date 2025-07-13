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


when isMainModule:
    let stack: Stack[string] = new_stack[string]()