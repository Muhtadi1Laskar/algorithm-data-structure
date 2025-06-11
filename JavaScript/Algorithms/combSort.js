const combSort = (array) => {
    let shrinkFactor = 1.3;
    let gap = array.length;
    let swapped = true;

    while(gap > 1 || swapped) {
        gap = Math.floor(gap / shrinkFactor);

        if(gap < 1) {
            gap = 1;
        }

        swapped = false;

        for(let i = 0; i + gap < array.length; i++) {
            if (array[i] > array[i + gap]) {
                [array[i], array[i + gap]] = [array[i + gap], array[i]];
                swapped = true;
            }
        }
    }
    return array;
}