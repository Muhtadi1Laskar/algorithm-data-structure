type
    DynamicArray = ref object
        capacity: int
        data: seq[int]
        length: int

proc new_array(size: int): DynamicArray =
    result = DynamicArray(capacity: size, data: @[])

proc push(self: DynamicArray, item: int) = 
    if self.data.len >= self.capacity:
        echo "No more capacity"
        return

    self.data.add(item)

proc toString(self: DynamicArray): string =
  result = $self.data

when isMainModule:
    let arr = new_array(10)

    for i in 0 .. 50:
        arr.push(i)

    echo arr.toString()
