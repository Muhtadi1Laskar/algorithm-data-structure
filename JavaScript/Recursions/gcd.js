const gcd = (a, b) => {
    if(a === b) {
        return a;
    }

    if(a > b) {
        return gcd(a-b, b);
    }
    return gcd(b, b-a);
}

console.log(gcd(6, 9));