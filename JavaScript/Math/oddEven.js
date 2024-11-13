const fn1 = (n) => {
    if (n % 2 == 0) {
        return 'Even';
    }
    return 'Odd';
}

const fn2 = n => [...'EOVDEDN']
    .filter((_, i) => i % 2 === (n & 1))
    .join('');

const fn3 = n => ['0', '2', '4', '6', '8'].includes(String(n).slice(-1));

const fn4 = n => Math.floor(n / 2) * 2 === n;
