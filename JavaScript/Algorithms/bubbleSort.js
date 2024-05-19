const bubbleSort = (array) => {
    for(let i=0;i<array.length;i++) {
        for(let j=i+1;j<array.length;j++) {
            if(array[i] > array[j]) {
                let temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    return array;
}

let array = [5, 4, 3, 2, 1];

console.log(bubbleSort(array));