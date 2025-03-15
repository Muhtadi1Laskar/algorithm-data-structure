const linearSearch = (array, item) => {
    let idx = 0;

    while (idx < array.length) {
        if (array[idx] === item) {
            return idx;
        }
        idx++;
    }
    return -1;
}

let arr = [1, 2, 3, 4, 5];

console.log(linearSearch(arr, 4));