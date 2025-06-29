type
    DynamicArray = ref object
        capacity: int
        data: seq[int]
        length: int

proc new_array(capacity: int): DynamicArray = 
    DynamicArray(capacity: capacity, data: newSeq[int](capacity), length: 0)


proc resize(self: var DynamicArray) = 
    let new_size = 2 * self.capacity
    var new_array = newSeq[int](new_size)

    for i in 0..<self.data.len: 
        new_array[i] = self.data[i]
    
    self.data = new_array
    self.capacity = new_size

proc push(self: var DynamicArray, item: int) = 
    if self.length == self.capacity:
        self.resize()
    
    self.data[self.length] = item
    self.length += 1

proc insert(self: var DynamicArray, index: int, item: int) =
  if index < 0 or index > self.length:
    echo "Index out of Range"
    return
  
  if self.length == self.capacity:
    self.resize()
  
  for i in countdown(self.length, index + 1):
    self.data[i] = self.data[i-1]
  
  self.data[index] = item
  self.length += 1

proc delete(self: var DynamicArray, index: int) = 
    if index < 0 or index > self.length:
        echo "Index out of range"
        return
    
    for i in index..<self.length-1:
        self.data[i] = self.data[i+1]
    
    self.data[self.length-1] = 0
    self.length -= 1

proc shrink(self: var DynamicArray) = 
    if self.length < self.capacity div 2:
        let new_size = self.capacity div 2
        var new_array = newSeq[int](new_size)

        for i in 0 ..< self.length:
            new_array[i] = self.data[i]
        
        self.capacity = new_size
        self.data = new_array

proc search(self: var DynamicArray, item: int): int =
    for i in 0 ..< self.length:
        if self.data[i] == item:
            return i
    return -1

proc get_length(self: var DynamicArray): int = 
    return self.length

proc toString(self: var DynamicArray): string = 
    result = $self.data