const shuffle = (array) => {
    if (array.length <= 1) {
        return null;
    }

    for (let i = array.length - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (i + 1));

        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

const isSorted = (array) => {
    for (let i = 0; i < array.length - 1; i++) {
        if (array[i] > array[i + 1]) {
            return false;
        }
    }
    return true;
}

const bogoSort = (array) => {
    let newArray = array;
    while (!isSorted(newArray)) {
        newArray = shuffle(array);
    }
    return array
}

console.log(bogoSort([5, 4, 3, 2, 1]));