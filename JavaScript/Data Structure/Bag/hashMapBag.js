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
        return this.isEmpty() ? undefined : Object.keys(this.bag).sort((a, b) => a - b).pop();
    }

    add(value) {
        this.count++;

        if (this.find(value)) {
            this.bag[value]++;
        } else {
            this.bag[value] = 1;
        }
    }

    remove(value) {
        if(this.find(value)) {
            this.count--;
            if(this.bag[value] > 1) {
                this.bag[value]--;
            } else {
                delete this.bag[value];
            }
        }
    }
}

const bag = new Bag();

bag.add("React");
bag.add("React");
bag.add("Flask");
bag.add("Django");
bag.add("Ruby on Rails");
bag.add("Ruby on Rails");
bag.add("Ruby on Rails");
bag.add("Ruby on Rails");
bag.add("Ruby on Rails");


console.log(bag.bag);

bag.remove("Ruby on Rails");
bag.remove("Ruby on Rails");
bag.remove("Ruby on Rails");
bag.remove("Ruby on Rails");
bag.remove("Ruby on Rails");
bag.remove("React");


console.log(bag.bag);