type
    Bag = ref object
        bag: seq[string]
        length: int

proc new_bag(): Bag = 
    Bag(bag: @[], length: 0)

proc push(self: var Bag, item: string) = 
    self.bag.add(item)
    self.length += 1

proc search(self: var Bag, item: string): string = 
    for i in 0..<self.length:
        if self.bag[i] == item:
            return self.bag[i]

    return "Not available"

proc log(self: var Bag) = 
    for i in 0..<self.length:
        echo self.bag[i]

proc get_len(self: var Bag): int = 
    return self.length

proc to_string(self: var Bag): string = 
    result = $self.bag

when isMainModule:
    var bags = new_bag()
    let data = ["Jack", "Mike", "Jenny", "Randall", "Natasha", "Milley"]

    for i in 0..<data.len:
        bags.push(data[i])
    
    echo bags.to_string()

    bags.log()

    echo bags.search("Mike")