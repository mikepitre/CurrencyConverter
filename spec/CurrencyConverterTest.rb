require "minitest/autorun"

require_relative "../lib/CurrencyConverter.rb"

class CurrencyConverter < Minitest::Test

  def test_hash_created_with_rates
    assert_equal({"USD": 1.00, "AUD": 1.26685 }, Currency_Converter.new.rates)
  end



end
