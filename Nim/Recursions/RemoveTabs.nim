proc remove_tabs(str: string): string = 
    if str.len == 0:
        return ""

    if str[0] == '\t' or str[0] == ' ':
        return remove_tabs(str[1 ..< str.len])

    return $str[0] & remove_tabs(str[1 ..< str.len])

when isMainModule:
    let str: string = "This is a   test     "

    echo remove_tabs(str)
