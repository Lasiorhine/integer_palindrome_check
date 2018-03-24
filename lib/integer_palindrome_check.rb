

require 'pry'

# NEW TO THIS ASSIGNMENT:
# Finds the number of digits in an integer.
# Space complexity: 2 variables, in addition to the parameter, so constant: O(1)
# Time complexity: 1 loop that will run n times, so linear: O(n)
def find_digit_count(number)
  modulo_result = nil
  modulo_exponent = 0
  until modulo_result == number do
    modulo_result = number  % (10 ** modulo_exponent)
    modulo_exponent += 1
  end
  modulo_exponent -= 1
  return modulo_exponent
end

#NEW FOR THIS ASSIGNMENT:
#method for determining whether an integer has an oddd or even number of digits -- new to this problem
=begin
  Space complexity:  In addition to the parameter, uses one variable, regardless of input, so complexity is constant, or O(n)

  Time complexity: No loops, just a couple of arithmetical operations, so time complexity is constant, or O(1)
=end
def odd?(number)
  odd = false
  if number > (2 * (number / 2))
    odd = true
  end
  return odd
end


# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
=begin
Space complexity:  seven variables, plus the parameter, regardless of length of input, so space complexity for this is constant, or O(1).

Time complexity:  taking his method by itself: 1 loop, which will run approximately (n/2 + 1) times, so time complexity is linear, or O(n).
=end


def is_palindrome(number)
  b_comp_digit = nil
  l_comp_digit = nil
  if number.nil? || number < 0
    return false
  elsif
    number <= 9 && number >= 0
    return true
  else
    digit_count = find_digit_count(number)
    odd = odd?(digit_count)
    big_end_exp = digit_count / 2
    if odd
      big_end_exp += 1
    end
    little_end = (number % 10 ** (digit_count / 2))
    bigend = (number / 10 ** big_end_exp)
    big_end_exp = (big_end_exp - 1)
    if odd
      big_end_exp -= 1
    end
    until big_end_exp == -1 do
      b_comp_digit = bigend / 10 ** big_end_exp
      l_comp_digit = little_end % 10
      if b_comp_digit != l_comp_digit
        # binding.pry
        return false
      else
        bigend = bigend % 10 ** big_end_exp
        little_end = little_end / 10
        big_end_exp -= 1
      end
    end
    return true
  end
end



=begin
  Space complexity: In addition to the parameter, 5 variables, regardless of input, so the complexity is constant, or O(1)

  Time complexity: Innvolves Ruby's length method, which has a time complexity of n. Also involves the string reverse method, which has a maximum complexity of n/2, or O(n).  There is also a ruby string-conversion method here, which I assume is linear, and runs a maximum of n/2 times. There are no loops beyond these, and the loops are additive, not multiplicative, so in the worst case, the time complexity will be 2n, or O(n).

=end

# Shruti wants me to try not to use .to_s, so the method below is deprecated, along with its helper.

# A method to reverse a string in place.  Recycled from a previous problem.
=begin
  Space complexity: In addition to the parameter, three variables, regardless of input, so space complexity is constant, or O(1).

  Time complexity: One loop, which will run a maximum of n/2 times, so complexity is linear, or O(n).
=end

# def string_reverse(my_string)
#   origin = my_string.length - 1
#   target = 0
#   temp = nil
#   (my_string.length / 2).times do
#     temp = my_string[target]
#     my_string[target] = my_string[origin]
#     my_string[origin] = temp
#     origin -= 1
#     target += 1
#   end
#   return my_string
# end

# def is_palindrome_original(number)
#   if number.nil? || number < 0
#     return false
#   elsif
#     number <= 9 && number >= 0
#     return true
#   else
#     number_length = number.to_s.length
#     odd = odd?(number_length)
#     begin_number_string = (number / 10 ** (number_length / 2)).to_s
#     if odd
#       end_number = (number % 10 ** ((number_length / 2) + 1))
#     else
#       end_number = (number % 10 ** (number_length / 2))
#     end
#     begin_number = (string_reverse(begin_number_string)).to_i
#     # binding.pry
#     if begin_number - end_number == 0
#       return true
#     else
#       return false
#     end
#   end
# end
