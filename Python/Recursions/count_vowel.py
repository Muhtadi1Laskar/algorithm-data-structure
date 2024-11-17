def check_vowel(char):
    if char in "aeiou":
        return 1
    return 0


def count_vowel(str, str_len):
    if str_len == 1:
        return check_vowel(str[0])
    return count_vowel(str, str_len - 1) + check_vowel(str[str_len - 1])


s = "educativeio"
print(count_vowel(s, len(s)))
