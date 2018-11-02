def bad_two_sum?(arr, target_sum)
  arr.each_index do |i| 
    arr[i+1..-1].each_index do |j| 
      p i
      p j
      p "--"
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false