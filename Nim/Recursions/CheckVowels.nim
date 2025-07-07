proc check_vowels(c: char): int = 
    var vowels: string = "aeiou"

    for ch in vowels:
        if ch == c:
            return 1
    return 0

proc count_vowels(str: string, n: int): int = 
    if n == 1:
        return check_vowels(str[0])
    return count_vowels(str, n-1) + check_vowels(str[n-1])


when isMainModule:
    let str: string = "This is a text"
    let n: int = str.len

    echo count_vowels(str, n)