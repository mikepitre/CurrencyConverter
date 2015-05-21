require "minitest/autorun"

require_relative "../lib/Currency.rb"

class CurrencyTest < Minitest::Test

  def test_object_created_with_amount_and_code
    new_object = Currency.new(100, "USD")
    assert(new_object.amount == 100)
    assert(new_object.code == "USD")
  end

  def test_objects_with_same_amount_and_code_are_equal
    object1 = Currency.new(50, "AUD")
    object2 = Currency.new(50, "AUD")
    assert(object1 == object2)
  end







end
