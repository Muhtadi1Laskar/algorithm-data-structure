function fib(n)
    if n <= 2
        return 1
    end
    return fib(n-1) + fib(n-2)
end


function fib_memo(n, memo = Dict())
    if haskey(memo, n)
      return memo[n]
    end
    if n <= 1
      return n  # Base case
    end
    memo[n] = fib_memo(n-1, memo) + fib_memo(n-2, memo)
    return memo[n]
end
  
# Example usage
n = 10
println(fib_recursive(n)) 
println(fib_memo(n))  
  