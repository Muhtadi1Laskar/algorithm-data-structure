import strutils 

type
    Node = ref object
        value: string
        next: Node
type
    LinkedList = ref object
        head: Node
        length: int

proc new_linked_list(): LinkedList =
    LinkedList(head: nil)

proc add_head(self: LinkedList, node: Node) = 
    self.head = node
    self.length += 1
    return

proc pre_append(self: LinkedList, item: string) =
    let new_node = Node(value: item, next: nil)

    if self.head.isNil:
        self.add_head(new_node)
        return

    new_node.next = self.head
    self.head = new_node
    self.length += 1

proc append(self: LinkedList, item: string) = 
    let new_node = Node(value: item, next: nil)

    if self.head.isNil:
        self.add_head(new_node)
        return

    var current_node = self.head

    while not current_node.next.isNil:
        current_node = current_node.next
    
    current_node.next = new_node
    self.length += 1

proc insert(self: LinkedList, item: string, index: int) = 
    if index < 0 or index > self.length + 1:
        echo "Index out of range"
        return

    if index == 1:
        self.pre_append(item)
        return

    let new_node = Node(value: item, next: nil)
    var previous_node = self.head

    for i in 1..<index-1:
        if not previous_node.isNil:
            previous_node = previous_node.next
    
    new_node.next = previous_node.next
    previous_node.next = new_node
    self.length += 1
    return


proc search(self: LinkedList, index: int): string = 
    if index <= 0 or index > self.length:
        echo "Index out of range"
        return ""

    if self.head.isNil:
        echo "The list is empty"
        return ""

    var current_node = self.head
    
    for i in 1..<index:
        if not current_node.isNil:
            current_node = current_node.next

    return current_node.value  

proc log(self: LinkedList): string = 
    var result: seq[string] = @[]
    var current_node = self.head

    while not current_node.isNil:
        result.add(current_node.value)
        current_node = current_node.next

    return join(result, " ---> ")

when isMainModule:
    let list = new_linked_list()

    list.append("C")
    list.append("JavaScript")
    list.append("Python")
    list.append("Haskell")
    list.append("Clojure")
    list.append("Odin")

    echo  list.log()

    list.pre_append("Assembly")
    list.pre_append("Machine Code")

    echo list.log()

    list.insert("Ruby", 9)

    echo list.log()

    list.insert("Nim", 10)

    echo list.log()

