def remove_duplicate(str):
    if not str:
        return ""
    
    if len(str) == 1:
        return str
    
    if str[0] == str[1]:
        return remove_duplicate(str[1:])
    
    return str[0] + remove_duplicate(str[1:])

print(remove_duplicate("Hello Woorlld"))