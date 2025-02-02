class Bag:
    def __init__(self):
        self.bag = {}
        self.count = 0

    def is_empty(self):
        return self.count == 0

    def find(self, value):
        return value in self.bag

    def get_greatest(self):
        if self.is_empty():
            return None
        return max(self.bag.keys(), key=lambda x: int(x) if str(x).isdigit() else x)

    def add(self, value):
        self.count += 1

        if self.find(value):
            self.bag[value] += 1
        else:
            self.bag[value] = 1

    def remove(self, value):
        if self.find(value):
            self.count -= 1
            if self.bag[value] > 1:
                self.bag[value] -= 1
            else:
                del self.bag[value]


bag = Bag()

bag.add("React")
bag.add("React")
bag.add("Flask")
bag.add("Django")
bag.add("Ruby on Rails")
bag.add("Ruby on Rails")
bag.add("Ruby on Rails")
bag.add("Ruby on Rails")
bag.add("Ruby on Rails")

print(bag.bag)

bag.remove("Ruby on Rails")
bag.remove("Ruby on Rails")
bag.remove("Ruby on Rails")
bag.remove("Ruby on Rails")
bag.remove("Ruby on Rails")
bag.remove("React")

print(bag.bag)
