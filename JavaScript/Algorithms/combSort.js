import { bubbleSort } from './bubbleSort.js';

const combSort = (array) => {
    let l = 0;
    let r = array.length - 1;
    let shrinkFactor = 1.3;
    let gap = r - l + 1;

    for (; ;) {
        gap = Math.floor(gap / shrinkFactor);

        if (gap === 1) {
            return bubbleSort(array);
        }
        for (let i = l; i <= r - gap; i++) {
            [array[i], array[i + 1]] = [array[i + 1], array[i]];
        }
    }
    return array;
}

console.log(combSort([5, 4, -3, 2, 1]))