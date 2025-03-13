const oddEvenSort = (array) => {
    let sorted = false;

    while (!sorted) {
        sorted = true;

        for (let i = 0; i < array.length; i += 2) {
            if (array[i] > array[i + 1]) {
                let temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
                sorted = false;
            }
        }

        for (let i = 1; i < array.length; i += 2) {
            if (array[i] > array[i + 1]) {
                let temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
                sorted = false;
            }
        }
    }
    return array;
}

let array = [5, 4, 3, 2, 1];

console.log(oddEvenSort(array));