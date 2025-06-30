import strutils
import math

type
    HashMap = ref object
        arr: seq[seq[string]]
        size: int

proc hash(key: string): int = 
    var hashs: int = 0

    for i in key:
        hashs = ((hashs shl  5) - hashs) + ord(i)
        hashs = hashs and 0xffffffff
    
    result = abs(hashs)
    

proc new_hash_map(): HashMap = 
    return HashMap(arr: @[@[]], size: 0)

when isMainModule:
    var hash_map = new_hash_map()

    var h = hash("This is a messages")

    echo h
    