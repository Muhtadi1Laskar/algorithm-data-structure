using DataStructures

struct HashMap
    size::Int
    array::Vector{Tuple{Any, Any}}
end

function HashMap(size=10)
    return HashMap(size, fill(nothing, size))
end

function set!(hash_map::HashMap, key, value)
    hashed_key = hash(key)
    index = hashed_key % hash_map.size

    for i in 1:length(hash_map.array[index])
        if hash_map.array[index][i][1] == key
            hash_map.array[index][i] = (key, value)
            return
        end
    end

    push!(hash_map.array[index], (key, value))
end

function get(hash_map::HashMap, key)
    hashed_key = hash(key)
    index = hashed_key % hash_map.size

    for k, v in hash_map.array[index]
        if k == key
            return v
        end
    end

    return nothing
end

hash_map = HashMap()

items = [
    ("Name", "Luffy"),
    ("Occupation", "Pirate"),
    ("Age", 20),
    ("Favourite Food", "Meat"),
    ("Devil Fruit User", true),
]

for (key, value) in items
    set!(hash_map, key, value)
end

println(hash_map.array)
println(get(hash_map, "Devil Fruit User"))