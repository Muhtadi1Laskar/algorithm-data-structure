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


when isMainModule:
    let bag = new_hash_map_bag()

    bag.add("React")
    bag.add("React")
    bag.add("Nim")

    echo bag.bag