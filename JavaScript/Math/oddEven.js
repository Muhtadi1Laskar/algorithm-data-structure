const fn1 = (n) => {
    if (n % 2 == 0) {
        return 'Even';
    }
    return 'Odd';
}

const fn2 = n => [...'EOVDEDN'].filter((_, i) => i % 2 === (n&1)).join('');

