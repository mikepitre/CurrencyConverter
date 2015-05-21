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

  def test_objects_with_diff_amount_or_code_are_not_equal
    object1 = Currency.new(100, "USD")
    object2 = Currency.new(100, "AUD")
    assert(object1 != object2)
  end

  def test_objects_with_same_code_should_be_able_to_be_added
    object1 = Currency.new(100, "AUD")
    object2 = Currency.new(50, "AUD")
    assert_equal(150, object1 + object2)
  end

  def test_objects_with_same_code_should_be_able_to_be_subtracted
    object1 = Currency.new(100, "AUD")
    object2 = Currency.new(50, "AUD")
    assert_equal(50, object1 - object2)
  end

  def test_objects_with_different_currency_codes_raise_error_when_added_or_subtracted
    object1 = Currency.new(100, "USD")
    object2 = Currency.new(100, "AUD")
    assert_raises(*DifferentCurrencyCode) {object1 + object2}
  end

  def test_objects_able_to_be_mulitplied_by_fixnum_or_float
    object1 = Currency.new(100, "USD")
    assert_equal(90, object1 * 0.9)
  end
end
