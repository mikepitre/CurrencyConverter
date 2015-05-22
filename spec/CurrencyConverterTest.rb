require "minitest/autorun"

require_relative "../lib/CurrencyConverter.rb"

class CurrencyConverter < Minitest::Test

  def test_hash_created_with_rates
    assert_equal({"USD": 1.00, "AUD": 1.27941, "EUR": 0.90824 }, Currency_Converter.new.rates)
  end

  def test_currency_converter_works_with_known_currencies
    object1 = Currency.new(10, :USD)
    assert_equal(12.79, Currency_Converter.new.convert(object1, :AUD ))
  end

  def test_currecy_converter_works_between_any_currencies_it_knows
    object1 = Currency.new(10, :AUD)
    assert_equal(7.10, Currency_Converter.new.convert(object1, :EUR))
  end

end
