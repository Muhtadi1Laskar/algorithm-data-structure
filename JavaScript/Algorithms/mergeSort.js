const merge = (left, right) => {
    let merged = [];
    let i = 0;
    let j = 0;

    while(i < left.length && j < right.length) {
        if(left[i] <= right[j]) {
            merged.push(left[i]);
            i += 1;
        }
        else {
            merged.push(right[j]);
            j += 1;
        }
    }
    while(i < left.length) {
        merged.push(left[i]);
        i++;
    }
    while(j < right.length) {
        merged.push(right[j]);
        j++;
    }
    return merged;
}

const mergeSort = (array) => {
    if(array.length <= 1) {
        return array;
    }
    let mid = Math.floor(array.length / 2);
    let left = mergeSort(array.slice(0, mid));
    let right = mergeSort(array.slice(mid));

    return merge(left, right);
}

const array = [2, 3, 1, 666, 8, 43, 9, 43, 6];
console.log(mergeSort(array));