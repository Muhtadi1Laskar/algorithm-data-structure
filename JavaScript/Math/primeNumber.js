const isPrime = (n) => {
    for(let i = 2; i < n; i++) {
        if(n % i === 0) {
            return false;
        }
    }
    return true;
}

for(let i = 1; i < 100; i++) {
    console.log(isPrime(i));
}