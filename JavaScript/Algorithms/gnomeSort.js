const gnomeSort = (array) => {
    let index = 0;

    while(index < array.length) {
        if(index === 0) {
            index += 1;
        }
        else if(array[index] >= array[index-1]) {
            index++;
        }
        else {
            let temp = array[index];
            array[index] = array[index-1];
            array[index-1] = temp;
            index--;
        }
    }
    return array;
}

console.log(gnomeSort([5, 4, 3, 2, 1]));