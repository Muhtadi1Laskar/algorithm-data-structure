class HashMap:
    def __init__(self, size=10):
        self.size = size
        # Each slot in the array can store multiple key-value pairs (in case of collisions)
        self.array = [[] for _ in range(size)]

    def set(self, key, value):
        hashed_key = hash(key)
        index = hashed_key % self.size
        
        # Check if the key already exists and update the value
        for i, (k, v) in enumerate(self.array[index]):
            if k == key:
                self.array[index][i] = (key, value)  # Update the value
                return

        # If the key doesn't exist, append the new key-value pair
        self.array[index].append((key, value))

    def get(self, key):
        hashed_key = hash(key)
        index = hashed_key % self.size

        # Search for the key in the bucket (index in the array)
        for k, v in self.array[index]:
            if k == key:
                return v  # Return the value if found

        # If the key is not found
        return None


# Create an instance of HashMap
obj = HashMap(6)

# Sample items to store in the hash map
items = [("Name", "Luffy"), ("Occupation", "Pirate"), ("Age", 20), ("Favourite Food", "Meat"), ("Devil Fruit User", True)]

# Set key-value pairs in the hash map
for key, value in items:
    obj.set(key, value)

# Print the internal array (to visualize how key-value pairs are stored)
print(obj.array)

# Get and print the value for the key "Devil Fruit User"
print(obj.get("Occupation"))
