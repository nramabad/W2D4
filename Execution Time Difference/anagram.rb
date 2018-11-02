
# PHASE I: O(n!)
def first_anagram?(str1, str2)
  perm(str1.chars).include?(str2.chars)
end

def perm(chars)

  return [chars] if chars.length <= 1

  letter = chars.shift
  combos = perm(chars)

  perms = []

  combos.each do |combo|
    (0..combo.length).each do |i|
      perms << combo[0...i] + [letter] + combo[i.. -1]
    end
  end
  perms
end

# PHASE II: O(n^2)
def second_anagram?(str1, str2)
  return false unless str1.length == str2.length
  
  str1.each_char do |ch|
    idx = str2.index(ch)
    return false if idx.nil?
    str2 = str2.chars[0...idx].join + str2.chars[idx + 1..-1].join
  end
  str2 == ""
end

# PHASE III: O(n^2)
# AT BEST CASE: ruby's in-built quick sort is n*log(n) which is better than PHASE II.
# AT WORST CASE: ruby's in-built quick sort is n^2 which is the same as PHASE II,
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

#PHASE IV: O(n)
def fourth_anagram?(str1, str2)
  letters = Hash.new(0)
  
  str1.each_char { |ch| letters[ch].nil? ? letters[ch] = 1 : letters[ch] += 1 }
  str2.each_char do |ch| 
    return false if letters[ch].nil?
    letters[ch] > 1 ? letters[ch] -= 1 : letters.delete(ch)
  end
  letters.empty?
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives") 
