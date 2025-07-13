const SIZE: int = 5

type 
    Stack[T] = ref object
        stack: array[SIZE, T]
        top: int

proc new_stack[T](): Stack[T] = 
    return Stack[T](stack: default(array[SIZE, T]), top: -1)

proc push[T](stack: Stack[T], item: T) = 
    if stack.top == SIZE-1:
        echo "Index out of range"
        return
    stack.top += 1
    stack.stack[stack.top] = item

proc pop[T](stack: Stack[T]) = 
    if stack.top > -1:
        stack.top -= 1

proc peak[T](stack: Stack[T]): string = 
    if stack.top < -1:
        return "The stack is empty"
    return stack.stack[stack.top]

proc get_length[T](stack: Stack[T]): int = 
    if stack.top < 0:
        return 0
    return stack.stack.len

when isMainModule:
    let stack: Stack[string] = new_stack[string]()

    stack.push("React.js")
    stack.push("Angular")
    stack.push("Solid.js")
    stack.push("Apline.js")
    stack.push("Django")

    echo stack.stack

    stack.pop()
    echo stack.peak()
    stack.push("Flask")

    echo stack.stack