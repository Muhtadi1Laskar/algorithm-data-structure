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



when isMainModule:
    let arr = new_array()

    for i in 1..10:
        arr.push(i)

    
    echo arr.array