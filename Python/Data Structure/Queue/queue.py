class NewItem:
    def __init__(self, item):
        self.item = item
        self.next = None

class Queue:
    def __init__(self, item):
        self.head = NewItem(item)
        self.tail = self.head
        self.length = 1

    def enqueue(self, item):
        new_node = NewItem(item)
        new_node.next = self.head
        self.head = new_node

        self.length += 1
        return None

    def dequeue(self):
        if self.head == self.tail:
            self.head = self.tail = None
            self.length -= 1
            return None

        previous_node = self.head

        while previous_node.next != self.tail:
            previous_node = previous_node.next

        self.tail = previous_node
        self.tail.next = None
        self.length -= 1

        return None

    def peak(self):
        return self.head.item

    def print_queue(self):
        current_node = self.head
        li = []

        while current_node:
            li.append(current_node.item)

            current_node = current_node.next

        return li


queue = Queue(1)

queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)

print(queue.print_queue())

queue.dequeue()
queue.dequeue()
queue.dequeue()

print(queue.print_queue())
print(queue.peak())
