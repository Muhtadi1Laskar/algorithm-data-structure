import strutils 

type 
    Node = ref object
        value: string
        next: Node

type 
    BagLinkedList = ref object
        head: Node
        length: int


proc newLinkedListBag(): BagLinkedList = 
    return BagLinkedList(head: nil)

proc append(self: BagLinkedList, item: string) =
    let new_node = Node(value: item, next: nil)

    if self.head.isNil:
        self.head = new_node
        self.length += 1
        return

    var current_node = self.head

    while not current_node.next.isNil:
        current_node = current_node.next
    
    current_node.next = new_node
    self.length += 1

proc log(self: BagLinkedList): string = 
    if self.head.isNil:
        echo "The list is empty"
        return ""

    var result: seq[string] = @[]
    var current_node = self.head

    while not current_node.isNil:
        result.add(current_node.value)
        current_node = current_node.next
    
    return join(result, " ---> ")

when isMainModule:
    let list = newLinkedListBag()

    let data = ["Jack", "Mike", "Jenny", "Randall", "Natasha", "Milley"]

    for i in 0..<data.len:
        list.append(data[i])
    
    echo list.log()
    

