type
    HashMap = ref object
        arr: seq[seq[string]]
        size: int

proc new_hash_map(): HashMap = 
    return HashMap(arr: @[@[]], size: 0)

when isMainModule:
    var hash_map = new_hash_map()
    