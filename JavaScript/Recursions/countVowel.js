const checkVowel = (n) => {
    const vowels = "aeiou";

    for(let i = 0; i < vowels.length; i++) {
        if(vowels[i] === n) {
            return 1;
        }
    }
    return 0;
}

const countVowel = (str, strLen) => {
    if(strLen === 1) {
        return checkVowel(str[0]);
    }
    return countVowel(str, strLen-1) + checkVowel(str[strLen-1]);
}

const s = "educativeio";
console.log(countVowel(s, s.length));