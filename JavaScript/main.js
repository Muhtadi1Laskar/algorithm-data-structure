const DOLLAR_TO_BDT_RATE = 123.28;

const calculateProfit = (totalCost, sellingPrice, soldAmount) => {
    const perPersonCost = Math.floor(totalCost / 3);
    const sellingPriceInBDT = (sellingPrice * soldAmount) * DOLLAR_TO_BDT_RATE;
    console.log(sellingPriceInBDT / 3);
    const perPersonProfit = Math.floor(sellingPriceInBDT / 3) - perPersonCost;
    const profitPercentage = (perPersonProfit / perPersonCost) * 100
    return [perPersonProfit, profitPercentage];
}

const totalOperaionCost = 11350;
const amountOfProductSold = 50;
const sellingPrice = 20;

console.log(calculateProfit(totalOperaionCost, sellingPrice, amountOfProductSold));


