import std/[strutils]

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

proc push[T](stack: Stack[T], value: T) = 
    var new_node: Node[string] = Node[T](value: value)

    if stack.top.isNil:
        stack.top = new_node
        stack.length += 1
        return

    new_node.next = stack.top
    stack.top = new_node
    stack.length += 1
    return

proc remove[T](stack: Stack[T]) = 
    if stack.top.isNil:
        echo "The stack is empty"
        return 

    stack.top = stack.top.next
    stack.length -= 1

proc peak[T](stack: Stack[T]): string = 
    if stack.top.isNil:
        return "The stack is empty"
    return stack.top.value

proc log[T](stack: Stack[T]): string = 
    var stack_value: seq[string] = @[]
    var current_node: Node[string] = stack.top

    while not current_node.isNil:
        stack_value.add(current_node.value)
        current_node = current_node.next

    return join(stack_value, " <---- ")


when isMainModule:
    let stack: Stack[string] = new_stack[string]()

    stack.push("Luffy")
    stack.push("Zoro")
    stack.push("Nami")
    stack.push("Usopp")
    stack.push("Sanji")
    stack.push("Chopper")
    stack.push("Robin")
    stack.push("Franky")
    stack.push("Brook")

    echo stack.log()
    echo stack.peak()

    stack.remove()
    stack.remove()
    stack.remove()

    echo stack.log()
    echo stack.peak()
