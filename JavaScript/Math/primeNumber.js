const isPrime = (n) => {
    for (let i = 2; i <= Math.sqrt(n); i++) {
        if (n % i === 0) {
            return false;
        }
    }
    return n > 1;
}

const generatePrime = (n) => {
    let numbers = [];

    for (let i = 2; i <= n; i++) {
        if (isPrime(i)) {
            numbers.push(i);
        }
    }
    return numbers;
}

console.log(generatePrime(100))