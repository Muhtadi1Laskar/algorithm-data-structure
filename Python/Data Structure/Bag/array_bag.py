class Bag:
    def __init__(self):
        self.bag = []
        self.len = 0
    
    def push(self, value):
        self.bag.append(value)
        self.len += 1
        return
    
    def get_len(self):
        return self.len
    
    def log(self):
        idx = 0

        while idx < self.len:
            print(self.bag[idx])

            idx += 1
        return
    

bag = Bag()

bag.push("Saitama")
bag.push("Luffy")
bag.push("Naruto")
bag.push("Ichigo")

print(bag.get_len())
print(bag.log())