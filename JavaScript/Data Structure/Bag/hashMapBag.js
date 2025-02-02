class Bag {
    constructor() {
        this.bag = {};
        this.count = 0;
    }

    isEmpty() {
        return this.count === 0;
    }

    getGreatest() {
        return this.isEmpty ? undefined : Object.keys(this.bag).sort((a, b) => a-b)[0];
    }
}