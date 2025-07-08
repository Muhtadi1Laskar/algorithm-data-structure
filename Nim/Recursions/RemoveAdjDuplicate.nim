proc remove_duplicate(str: string): string = 
    if str.len == 0:
        return ""

    if str.len == 1:
        return str

    if str[0] == str[1]:
        return remove_duplicate(str[1 ..< str.len])

    return str[0] & remove_duplicate(str[1 ..< str.len])

when isMainModule:
    let str: string = "heeelloe Worldd"

    echo remove_duplicate(str)