const size = 10

type
    Array = ref object
        array: array[size, int]
        length: int


proc new_array(): Array = 
    Array(length: 0)

proc push(self: Array, item: int) = 
    if self.length >= size: 
        echo "Array is full"
        return
    self.array[self.length] = item
    self.length += 1
    return

proc delete(self: Array, index: int): seq[int] = 
    if index < 0 or index >= self.length: 
        echo "Index out of range"
        return @[]

    for i in index ..< self.length - 1:
        self.array[i] = self.array[i + 1]
    
    self.length -= 1
    self.array[self.length] = 0

    result = @[]

    for i in 0 ..< self.length:
        result.add self.array[i]

proc get_length(self: Array): int = 
    return self.length

proc traverse(self: Array, fn: proc (x: int): int): seq[int] =
    result = @[]
    for i in 0 ..< self.length:
        result.add fn(self.array[i])
    
proc double(x: int): int = 
    x * x

when isMainModule:
    let arr = new_array()

    for i in 1..10:
        arr.push(i)

    
    echo arr.array

    let new_arrays = arr.traverse(double)

    echo new_arrays