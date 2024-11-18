const fibonacciSeries = (n) => {
    let a = 0;
    let b = 1;
    let result = [];

    while(a < n) {
        result.push(a);
        [a, b] = [b, a + b];
    }
    return result;
}


console.log(fibonacciSeries(100));