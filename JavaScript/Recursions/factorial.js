const fact = n => n <= 0 ? 1 : fact(n-1) * n;

console.log(fact(7));