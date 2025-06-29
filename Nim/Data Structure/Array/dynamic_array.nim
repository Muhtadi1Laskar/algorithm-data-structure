type
    DynamicArray = ref object
        capacity: int
        data: seq[int]
        length: int

proc new_array(capacity: int): DynamicArray = 
    DynamicArray(capacity: capacity, data: newSeq[int](capacity), length: 0)


proc push(self: var DynamicArray, item: int) = 
    if self.length >= self.capacity:
        return
    
    self.data[self.length] = item
    self.length += 1