class Bag {
    constructor() {
        this.bag = {};
        this.count = 0;
    }

    isEmpty() {
        return this.count === 0;
    }

    find(value) {
        return value in this.bag;
    }

    getGreatest() {
        return this.isEmpty ? undefined : Object.keys(this.bag).sort((a, b) => a - b)[0];
    }

    add(value) {
        this.count++;

        if(this.find(value)) {
            this.bag[value]++;
        } else {
            this.bag[value] = 1;
        }
    }
}

const bag = new Bag();

bag.add("React");
bag.add("React");
bag.add("Flask");
bag.add("Django");
bag.add("Ruby on Rails");

console.log(bag.bag);