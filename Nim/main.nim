# const Size = 10

# type
#   Array = ref object
#     array: array[Size, int]
#     len: int

# # Constructor
# proc newArray(): Array =
#   Array(len: 0)

# # Push method
# proc push(self: Array, item: int) =
#   if self.len >= Size:
#     echo "Array is full"
#     return
#   self.array[self.len] = item
#   self.len += 1

# # Delete method
# proc delete(self: Array, index: int): seq[int] =
#   if index < 0 or index >= self.len:
#     echo "Index out of range"
#     return @[]

#   for i in index ..< self.len - 1:
#     self.array[i] = self.array[i + 1]
    
#   self.len -= 1
#   self.array[self.len] = 0

#   result = @[]
#   for i in 0 ..< self.len:
#     result.add self.array[i]

# # Traverse method
# proc traverse(self: Array, fn: proc (x: int): int): seq[int] =
#   result = @[]
#   for i in 0 ..< self.len:
#     result.add fn(self.array[i])

# # GetLength method
# proc getLength(self: Array): int =
#   self.len

# # Example function
# proc double(x: int): int =
#   x * x

# # === Example Usage ===
# when isMainModule:
#   let arr = newArray()

#   for i in 1..10:
#     arr.push(i)

#   echo "Original:", arr.array[0 ..< arr.len]  # OK: array slice

#   let deleted = arr.delete(4)
#   echo "After deletion:", deleted

#   let squared = arr.traverse(double)
#   echo "Squared:", squared

#   echo "Length:", arr.getLength()


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


when isMainModule:
    let arr = new_array()

    for i in 1..10:
        arr.push(i)

    
    echo arr.array

    let deleted = arr.delete(9)
    echo "After deletion:", deleted