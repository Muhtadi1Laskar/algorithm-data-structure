const square = (n) => {
    if(n === 0) {
        return 0;
    }
    return square(n - 1) + (2 * n) - 1;
}

console.log(square(5));