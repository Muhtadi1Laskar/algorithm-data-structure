function fact(n)
    if n <= 0
        return 1
    end
    return fact(n-1) * n
end

println(fact(7))