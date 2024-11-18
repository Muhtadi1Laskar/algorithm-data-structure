def remove_tabs(str):
    if len(str) == 0:
        return ""
    
    if str[0] == '\t' or str[0] == ' ':
        return remove_tabs(str[1:])
    
    return str[0] + remove_tabs(str[1:])

print(remove_tabs("H e l L o W o r l d"))