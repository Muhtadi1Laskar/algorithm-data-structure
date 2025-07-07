proc decimal_to_binary(n: int): string = 
    if n <= 1:
        return $n
    return decimal_to_binary(n div 2) & decimal_to_binary(n mod 2)


when isMainModule:
    let number: int = 12345
    
    echo decimal_to_binary(number)