const decimalToBinary = (n) => {
    if(n <= 1) {
        return String(n);
    }
    return decimalToBinary(Math.floor(n / 2)) + decimalToBinary(n % 2);
}

console.log(decimalToBinary(11));