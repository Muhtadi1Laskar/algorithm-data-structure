import strutils, math, sequtils

type
  HashMap = ref object
    arr: seq[seq[string]]
    size: int

proc hash(self: HashMap, key: string): int =
  var hashs = 0
  for ch in key:
    hashs = ((hashs shl 5) - hashs) + ord(ch)
    hashs = hashs and 0xffffffff
  result = abs(hashs)

proc new_hash_map(): HashMap =
  result = HashMap(arr: newSeqWith(16, newSeq[string]()), size: 16)

proc set(self: HashMap, key: string, value: string) =
  let index = self.hash(key) mod self.size
  var bin = self.arr[index]

  for i in 0 ..< bin.len:
    if bin[i] == key:
      bin[i] = value
      self.arr[index] = bin
      return

  bin.add(key)
  bin.add(value)
  self.arr[index] = bin

proc get(self: HashMap, key: string): string =
  let index = self.hash(key) mod self.size
  let bin = self.arr[index]

  var i = 0
  while i < bin.len:
    if bin[i] == key:
      return bin[i + 1]
    i += 2

  raise newException(KeyError, "Key not found: " & key)


when isMainModule:
  let hash_map = new_hash_map()

  let data = [
    ("Name", "Luffy"),
    ("Occupation", "Pirate"),
    ("Age", "20"),
    ("Favourite Food", "Meat"),
    ("Devil Fruit User", "true"),
    ("Devil Fruit Name", "Gomu Gomu No Mi")
  ]

  for (k, v) in data:
    hash_map.set(k, v)

  echo hash_map.arr
  
  for (key, value) in data:
    echo hash_map.get(key)
