require 'minitest/skip_dsl'
require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'

require_relative '../lib/integer_palindrome_check'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "integer palindrome check" do
  describe "basic tests" do
    it "palindrome input with even digit count" do
      is_palindrome(1001).must_equal true
    end

    it "palindrome input with odd digit count" do
      is_palindrome(1234321).must_equal true
    end

    it "not a palindrome" do
      is_palindrome(1728371).must_equal false
    end
  end

  # check for edge cases
  describe "edge cases" do
    # if the parameter is an object, check for nil
    it "nil object is not an integer" do
      is_palindrome(nil).must_equal false
    end

    it "single digit palindrome" do
      is_palindrome(9).must_equal true
    end

    it "double digit palindrome" do
      is_palindrome(77).must_equal true
    end

    it "negative number" do
      is_palindrome(-44).must_equal false
    end

    it "zero" do
      is_palindrome(0).must_equal true
    end
  end
end
