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

proc delete(self: BagLinkedList, index: int) = 
    if index < 0 or index > self.length + 1:
        echo "Index out of range"
        return

    if index == 1:
        let current_node = self.head.next
        self.head = current_node
        self.length -= 1
        return

    var previous_node = self.head

    for i in 1 ..< index-1:
        if not previous_node.isNil:
            previous_node = previous_node.next
    
    var current_node = previous_node.next
    previous_node.next = current_node.next
    self.length -= 1
    return

proc search(self: BagLinkedList, index: int): string = 
    if index < 0 or index > self.length + 1:
        echo "Index out of range"
        return " "
    
    var current_node = self.head
    var idx: int = 1

    while not current_node.isNil:
        if idx == index:
            return current_node.value
        current_node = current_node.next
        idx += 1

    return " "

proc get_len(self: BagLinkedList): int = 
    return self.length

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

    list.delete(5)

    echo list.log()

    echo list.search(data.len-3);
    

