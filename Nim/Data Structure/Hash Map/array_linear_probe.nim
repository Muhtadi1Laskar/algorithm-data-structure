import sequtils

const EMPTY_KEY: string = "<empty>"
const DELETED_KEY: string = "<deleted>"

type
  Entry = object
    key: string
    value: string

  HashMap = ref object
    table: seq[Entry]
    capacity: int
    count: int

proc hash(key: string, capacity: int): int =
  var h: int = 0
  for ch in key:
    h = ((h shl 5) - h) + ord(ch)
    h = h and 0xffffffff
  result = abs(h) mod capacity

proc newHashMap(capacity = 16): HashMap =
  result = HashMap(
    table: newSeqWith(capacity, Entry(key: EMPTY_KEY, value: "")),
    capacity: capacity,
    count: 0
  )

proc set(self: HashMap, key, value: string) =
  var idx: int = hash(key, self.capacity)
  var i: int = 0

  while i < self.capacity:
    let current: Entry = self.table[idx]

    if current.key == EMPTY_KEY or current.key == DELETED_KEY or current.key == key:
      self.table[idx] = Entry(key: key, value: value)
      inc self.count
      return

    idx = (idx + 1) mod self.capacity
    inc i

  echo "HashMap is full"

proc get(self: HashMap, key: string): string =
  var idx: int = hash(key, self.capacity)
  var i: int = 0

  while i < self.capacity:
    let current: Entry = self.table[idx]

    if current.key == EMPTY_KEY:
      break
    if current.key == key:
      return current.value

    idx = (idx + 1) mod self.capacity
    inc i

  return "Key not found"

proc delete(self: HashMap, key: string) =
  var idx: int = hash(key, self.capacity)
  var i: int = 0

  while i < self.capacity:
    let current: Entry = self.table[idx]
    if current.key == EMPTY_KEY:
      break
    if current.key == key:
      self.table[idx] = Entry(key: DELETED_KEY, value: "")
      dec self.count
      return

    idx = (idx + 1) mod self.capacity
    inc i

when isMainModule:
  let hm: HashMap = newHashMap()

  hm.set("name", "Luffy")
  hm.set("age", "20")
  hm.set("occupation", "Pirate")
  echo "Name: ", hm.get("name")
  echo "Age: ", hm.get("age")
  echo "Occupation: ", hm.get("occupation")

  hm.delete("age")
  echo "After deleting age -> ", hm.get("age")  # Should print: Key not found
