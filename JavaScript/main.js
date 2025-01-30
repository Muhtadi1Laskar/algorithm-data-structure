const isPower = (n) => {
    const x = Math.sqrt(n);
    return x * x === n
}

const power = n => Math.pow(n, 2);

const array = [10, 2, 6, 16, 20, -25];
const newArray = array.every(elem => elem % 2 === 0);
const doubleArray = array.map(elem => Math.pow(elem, 2));
const sum = doubleArray.reduce((a, b) => a + b, 0);
const strArray = ["1", "2", "4", "8", "16", "32"];
const numberArray = strArray.map(elem => power(elem));

console.log(numberArray);
console.log(["James Bond", 0, 0, 7].map(Boolean));