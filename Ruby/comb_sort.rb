def comb_sort(arr)
  shrink_factor = 1.3
  gap = arr.length
  swapped = true

  while gap > 1 || swapped
    gap = (gap / shrink_factor).to_i
    gap = 1 if gap < 1

    swapped = false

    (0...arr.length - gap).each do |i|
      if arr[i] > arr[i + gap]
        arr[i], arr[i + gap] = arr[i + gap], arr[i]
        swapped = true
      end
    end
  end

  arr
end

# Example usage
puts comb_sort([5, 4, 3, 2, 1]).inspect
