type
  DynamicStack = ref object
    array: seq[string]
    top: int

proc newDynamicStack(size: int): DynamicStack =
  result = DynamicStack(array: newSeq[string](size), top: -1)

proc resize(self: DynamicStack) =
  let newSize: int = self.array.len * 2
  var newArray: seq[string] = newSeq[string](newSize)

  for i in 0..<self.array.len:
    newArray[i] = self.array[i]

  self.array = newArray
  echo "\nResized stack to ", newSize

proc push(self: DynamicStack, item: string) =
  if self.top >= self.array.len - 1:
    self.resize()
  inc self.top
  if self.top < self.array.len:
    self.array[self.top] = item

proc pop(self: DynamicStack): string =
  if self.top > -1:
    result = self.array[self.top]
    dec self.top
  else:
    result = ""

proc peak(self: DynamicStack): string =
  if self.top == -1:
    return "The stack is empty"
  return self.array[self.top]

proc log(self: DynamicStack): seq[string] =
  return self.array


when isMainModule:
  let stack: DynamicStack = newDynamicStack(2)
  stack.push("Go")
  stack.push("Python")
  stack.push("Rust")  # Triggers resize
  echo "Top element: ", stack.peak()
  echo "Stack log: ", stack.log()
  discard stack.pop()
  echo "After pop: ", stack.peak()
