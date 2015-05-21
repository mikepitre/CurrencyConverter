require "minitest/autorun"

require_relative "../lib/Currency.rb"

class CurrencyTest < Minitest::Test

  def test_object_created_with_amount_and_code
    new_object = Currency.new(100, "USD")
    assert(new_object.amount == 100)
    assert(new_object.code == "USD")
  end







end
