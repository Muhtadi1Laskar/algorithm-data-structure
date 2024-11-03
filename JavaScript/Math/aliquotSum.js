const aliquotSum = (n) => {
    let result = 0;

    for(let i = 0; i < n; i++) {
        if(n % i === 0) {
            result += i;
        }
    }
    return result;
}

const checkUntouchable = (n) => {
    for(let i = 0; i < n*n; i++) {
        if(aliquotSum(i) === n) {
            return false;
        }
    }
    return true;
}

const checkAbundant = (n) => {
    if(aliquotSum(n) > n) {
        return true;
    }
    return false;
}

const num = 10;

console.log(aliquotSum(num));