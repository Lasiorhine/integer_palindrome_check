

require 'pry'

# A method to reverse a string in place.  Recycled from a previous problem.

=begin
  Space complexity: In addition to the parameter, three variables, regardless of input, so space complexity is constant, or O(1).

  Time complexity: One loop, which will run a maximum of n/2 times, so complexity is linear, or O(n).
=end

def string_reverse(my_string)
  origin = my_string.length - 1
  target = 0
  temp = nil
  (my_string.length / 2).times do
    temp = my_string[target]
    my_string[target] = my_string[origin]
    my_string[origin] = temp
    origin -= 1
    target += 1
  end
  return my_string
end

#method for determining whether an integer has an oddd or even number of digits -- new to this problem

=begin
  Space complexity:  In addition to the parameter, uses one variable, regardless of input, so complexity is constant, or O(n)

  Time complexity: No loops, just a couple of arithmetical operations, so time complexity is constant, or O(1)
=end

def odd_digits?(number_length)
  odd = false
  if number_length > (2 * (number_length / 2))
    odd = true
  end
  return odd
end


# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.

=begin
  Space complexity: In addition to the parameter, 5 variables, regardless of input, so the complexity is constant, or O(1)

  Time complexity: Innvolves Ruby's length method, which has a time complexity of n. Also involves the string reverse method, which has a maximum complexity of n/2, or O(n).  There is also a ruby string-conversion method here, which I assume is linear, and runs a maximum of n/2 times. There are no loops beyond these, and the loops are additive, not multiplicative, so in the worst case, the time complexity will be 2n, or O(n).

=end


def is_palindrome(number)
  if number.nil? || number < 0
    return false
  elsif
    number <= 9 && number >= 0
    return true
  else
    number_length = number.to_s.length
    odd = odd_digits?(number_length)
    begin_number_string = (number / 10 ** (number_length / 2)).to_s
    if odd
      end_number = (number % 10 ** ((number_length / 2) + 1))
    else
      end_number = (number % 10 ** (number_length / 2))
    end
    begin_number = (string_reverse(begin_number_string)).to_i
    # binding.pry
    if begin_number - end_number == 0
      return true
    else
      return false
    end
  end
end
