import strutils

type
    Node[T] = ref object
        value: T
        next: Node[T]

type 
    LinkedList[T] = ref object
        head: Node[T]
        length: int

proc new_linked_list[T](): LinkedList[T] = 
    return LinkedList[T](head: nil, length: 0)

proc append[T](self: LinkedList[T], value: T) = 
    var new_node = Node[T](value: value)

    if self.head.isNil:
        self.head = new_node
        self.length += 1
        return

    var current_node = self.head

    while not current_node.next.isNil:
        current_node = current_node.next

    current_node.next = new_node
    self.length += 1
    return

proc log[T](self: LinkedList[T]): string = 
    var result: seq[string] = @[]
    var current_node = self.head

    while not current_node.isNil:
        result.add($current_node.value)
        current_node = current_node.next

    return join(result, " ---> ")

when isMainModule:
    let list = new_linked_list[int]()
    
    # list.append("C")
    # list.append("JavaScript")
    # list.append("Python")
    # list.append("Haskell")
    # list.append("Clojure")
    # list.append("Odin")

    for i in 1 ..< 10:
        list.append(i)

    echo  list.log()