local function is_sorted(t)
    for i = 1, #t - 1 do
        if t[i] > t[i+1] then
            return false
        end
    end
    return true
end

local function shuffle(t)
    local n = #t
    for i = n, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

local function bogosort(t)
    while not is_sorted(t) do
        shuffle(t)
    end
    return t
end

math.randomseed(os.time())

local my_list = {3, 1, 4, 1, 5, 9, 2, 6}
print("Original list:")
for _, v in ipairs(my_list) do
    io.write(v .. " ")
end
print()

local sorted_list = bogosort(my_list)

print("Sorted list (via Bogosort):")
for _, v in ipairs(sorted_list) do
    io.write(v .. " ")
end
print()