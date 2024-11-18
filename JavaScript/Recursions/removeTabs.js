const removeTabs = (str) => {
    if(str.length === 0) {
        return "";
    }

    if(str[0] == '\t' || str[0] == ' ') {
        return removeTabs(str.slice(1));
    }
    return str[0] + removeTabs(str.slice(1));
}

console.log(removeTabs("H e l l o W o r l d"));