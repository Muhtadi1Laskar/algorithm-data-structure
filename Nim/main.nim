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

proc toString(self: var DynamicArray): string = 
    result = $self.data

when isMainModule:
  var arr = new_array(10)

  for i in 1 .. 25:
    arr.push(i)

  echo arr.toString()
  echo arr.length
  echo arr.data.len