require "minitest/autorun"

require_relative "../lib/CurrencyConverter.rb"

class CurrencyConverter < Minitest::Test

  def test_hash_created_with_rates
    assert_equal({"USD": 1.00, "AUD": 1.27941, "EUR": 0.90824 }, Currency_Converter.new.rates)
  end

  def test_currency_converter_works_with_known_currencies
    object1 = Currency.new(10, :USD)
    assert_equal(12.79, Currency_Converter.new.convert(object1, :AUD ))
    object2 = Currency.new(10, :USD)
    assert_equal(9.08, Currency_Converter.new.convert(object1, :EUR ))
  end

  def test_currecy_converter_works_between_any_2_currencies_it_knows
    object1 = Currency.new(10, :AUD)
    assert_equal(7.10, Currency_Converter.new.convert(object1, :EUR))
    object2 = Currency.new(12.79, :AUD)
    assert_equal(10, Currency_Converter.new.convert(object2, :USD))
  end

  def test_unknown_currency_error_when_trying_to_convert_to_unknown_currency
    object1 = Currency.new(10, :USD)
    assert_raises(*UnknownCurrencyCodeError) {Currency_Converter.new.convert(object1, :CUP)}
  end

end
