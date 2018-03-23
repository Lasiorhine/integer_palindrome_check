

require 'pry'

# A method to reverse a string in place.
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

#method for determining whether an integer has an oddd or even number of digits
def odd_digits?(number_length)
  odd = false
  if number_length > (2 * (number_length / 2))
    odd = true
  end
  return odd
end


# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
def is_palindrome(number)
  if number.nil?
    return false
  elsif
    number <= 9 && number >= -9
    return true
  else
    number_length = number.to_s.length
    if number < 0
      number = number * -1
    end
    odd = odd_digits?(number_length)
    begin_number = number / 10 ** (number_length / 2)
    if odd
      end_string = (number % 10 ** ((number_length / 2) - 1)).to_s
    else
      end_string = (number % 10 ** (number_length / 2)).to_s
    end
    end_number = (string_reverse(end_string)).to_i
    if begin_number - end_number == 0
      return true
    else
      return false
    end
  end
end
