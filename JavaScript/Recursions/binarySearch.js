const binarySearch = (array, item, l, r) => {
    if(l <= r) {
        let mid = Math.floor((l+r)/2);

        if(array[mid] === item) {
            return mid;
        }
        else if(array[mid] > item) {
            return binarySearch(array, item, l, mid-1);
        }
        else {
            return binarySearch(array, item, mid+1, r);
        }
    }
    else {
        return -1
    }
}

let array = [1, 2, 3, 4, 5];

console.log(binarySearch(array, 4, 0, array.length-1));