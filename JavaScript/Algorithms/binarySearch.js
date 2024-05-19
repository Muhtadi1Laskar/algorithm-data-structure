const binarySearch = (array, item) => {
    let l = 0;
    let r = array.length - 1;

    while (l <= r) {
        let mid = Math.floor((l + r) / 2);

        if (array[mid] === item) {
            return mid;
        } else if (array[mid] > item) {
            r = mid - 1;
        } else {
            l = mid + 1;
        }
    }
    return -1;
}

let array = [1, 2, 3, 4, 5];

console.log(binarySearch(array, 1));