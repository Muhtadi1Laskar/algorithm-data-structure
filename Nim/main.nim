type 
    Node = ref object
        value: string
        next: Node

type 
    BagLinkedList = ref object
        head: Node
        length: int


