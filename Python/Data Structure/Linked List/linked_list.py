class Node:
    def __init__(self, value):
        self.value = value
        self.next = None


class LinkedList:
    def __init__(self, value):
        self.head = Node(value)
        self.tail = self.head
        self.length = 1

    def push_front(self, value):
        new_node = Node(value)
        new_node.next = self.head
        self.head = new_node
        self.length += 1

        return None

    def push_back(self, value):
        new_node = Node(value)
        self.tail.next = new_node
        self.tail = new_node
        self.length += 1

        return None

    def search(self, value):
        current_node = self.head

        while current_node:
            if current_node.value == value:
                return current_node
            current_node = current_node.next
        return None

    def traverse_list(self, index):
        current_node = self.head
        current = 0

        while current != index:
            current_node = current_node.next
            current += 1
        return current_node

    def print_list(self):
        li = []
        current_node = self.head

        while current_node:
            li.append(current_node.value)
            current_node = current_node.next

        return li


linked_list = LinkedList("C")

linked_list.push_back("JavaScript")
linked_list.push_back("Python")
linked_list.push_back("Haskell")
linked_list.push_back("Ruby")
linked_list.push_back("Clojure")
linked_list.push_front("Odin")

print(linked_list.print_list())

print(linked_list.traverse_list(4).value)
