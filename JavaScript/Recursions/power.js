const power = (n, e) => {
    if(e === 0) {
        return 1;
    }
    return n * power(n, e-1);
}

console.log(power(10, 2));