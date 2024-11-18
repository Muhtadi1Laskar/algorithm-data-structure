const mod = (dividend, divisor) => {
    if(divisor < 0) {
        return 0;
    }

    if(dividend < divisor) {
        return dividend;
    }

    return mod(dividend - divisor, divisor);
}

console.log(mod(14, 4));