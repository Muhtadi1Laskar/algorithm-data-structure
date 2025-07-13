const SIZE: int = 5

type 
    Stack[T] = ref object
        stack: array[SIZE, T]
        top: int

proc new_stack[T](): Stack[T] = 
    return Stack[T](top: -1)




when isMainModule:
    let stack: Stack[string] = new_stack[string]()




