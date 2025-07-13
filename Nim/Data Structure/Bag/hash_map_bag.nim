import std/tables

type 
    HashMapBag = ref object
        bag: Table[string, int]
        length: int

proc new_hash_map_bag(): HashMapBag = 
    return HashMapBag(bag: initTable[string, int](), length: 0)

proc find(self: HashMapBag, item: string): bool = 
    return self.bag.hasKey(item)

proc add(self: HashMapBag, value: string) = 
    self.length += 1

    if self.find(value):
        self.bag[value] += 1
    else:
        self.bag[value] = 1
    
proc delete(self: HashMapBag, item: string) = 
    if self.find(item):
        self.length -= 1

        if self.bag[item] > 1:
            self.bag[item] -= 1
        else:
            del(self.bag, item)

proc greatest(self: HashMapBag): seq[string] =
    if self.bag.len == 0:
        return @[]

    var maxCount: int = 0
    for value in self.bag.values:
        if value > maxCount:
            maxCount = value

    result = @[]
    for k, v in self.bag.pairs:
        if v == maxCount:
            result.add(k)

when isMainModule:
    let bag: HashMapBag = new_hash_map_bag()

    bag.add("React")
    bag.add("React")
    bag.add("React")
    bag.add("React")
    bag.add("React")
    bag.add("Django")
    bag.add("Flasks")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Solid.js")
    bag.add("Ruby on Rails")
    bag.add("Angular")
    bag.add("Angular")
    bag.add("Angular")
    bag.add("Angular")

    echo bag.bag

    bag.delete("Ruby on Rails")
    echo bag.bag

    echo bag.greatest()
