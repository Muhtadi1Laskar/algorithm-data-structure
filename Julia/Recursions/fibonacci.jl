function fib(n)
    if n <= 2
        return 1
    end
    return fib(n-1) + fib(n-2)
end

function fib_loop(n)
    if n == 0
      return 0 
    end
  
    last = 0
    first = 1
  
    for i in 1:n-1 
      last, first = first, last + first
    end
  
    return first
  end
  
  println(fib_loop(10))