
# PHASE I: O(n^2)
# def my_min(list)
#   list.each_index do |i|
#     return list[i] if list.none? { |el| el < list[i] }
#   end
#   return list.first
# end

# PHASE II: O(n)
def my_min(list) 
  lowest = nil

  list.each_index do |i|
    lowest = list[i] if lowest.nil? || list[i] < lowest
  end
  lowest
end

# PHASE I: O(n^3)
# def sub_sum(list)
#   results = []
#   list.each_index do |j|
#     list[0..j].each_index do |i|
#       results << list[i..j]
#     end
#   end
#   max = nil
#   results.each do |arr| 
#     sum = arr.reduce(:+) 
#     max = sum if max.nil? || sum > max   
#   end
#   max
# end

# PHASE II: O(n)
def sub_sum(list)
  sums = []
  low = -1
  high_subsum = nil
  lowest = nil
  
  
  list.each_index do |j|
    sums << (sums.empty? || j == low + 1 ? list[j] : sums.last + list[j] )

    if sums.last < 0
      low = j
    end
    
    lowest = j if lowest.nil? || sums[lowest] > sums[low]
    high_subsum = j if high_subsum.nil? || sums.last > sums[high_subsum]

  end
  list[lowest + 1..high_subsum].reduce(:+)
end

list = [2, 3, -6, 7, -6, 7]
p sub_sum(list)