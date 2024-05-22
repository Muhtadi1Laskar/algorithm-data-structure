const fib = (n) => n <= 2 ? 1 : fib(n-1) + fib(n-2);

const fibMemo = (n, memo={}) => {
    if(n in memo) {
        return memo[n];
    }
    if(n <= 2) {
        return 1;
    }
    memo[n] = fibMemo(n-1, memo) + fibMemo(n-2, memo);
    return memo[n];
}

const fibLoop = (n) => {
    if(n === 0) {
        return n;
    }
    last = 0;
    next = 1;

    for(let i=1;i<n;i++) {
        [last, next] = [next, last + next];
    }
    return next;
}

// console.log(fib(10));
// console.log(fibMemo(100))
console.log(fibLoop(100));