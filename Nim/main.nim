type 
    Node = ref object
        value: string
        next: Node

type 
    BagLinkedList = ref object
        head: Node
        length: int


func newLinkedListBag(): BagLinkedList = 
    return BagLinkedList(head: nil)

func append(self: BagLinkedList, item: string) =
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

when isMainModule:
    let list = newLinkedListBag()

    let data = ["Jack", "Mike", "Jenny", "Randall", "Natasha", "Milley"]

    for i in 0..<data.len:
        list.append(data[i])
    
    echo list.head.value
    

