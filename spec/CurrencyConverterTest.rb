require "minitest/autorun"

require_relative "../lib/CurrencyConverter.rb"

class CurrencyConverter < Minitest::Test

  def test_hash_created_with_rates
    assert_equal({"USD": 1.00, "AUD": 1.27941, "EUR": 0.90824 }, Currency_Converter.new.rates)
  end

  def test_currency_converter_amount_works_with_known_currencies
    object1 = Currency.new(10, :USD)
    assert_equal(12.79, Currency_Converter.new.convert(object1, :AUD ).amount)
    object2 = Currency.new(10, :USD)
    assert_equal(9.08, Currency_Converter.new.convert(object1, :EUR ).amount)
  end

  def test_currecy_converter_amount_works_between_any_2_currencies_it_knows
    object1 = Currency.new(10, :AUD)
    assert_equal(7.10, Currency_Converter.new.convert(object1, :EUR).amount)
    object2 = Currency.new(12.79, :AUD)
    assert_equal(10, Currency_Converter.new.convert(object2, :USD).amount)
  end

  def test_converter_returns_new_object_with_correct_amount_and_new_code
    object1 = Currency.new(10, :USD)
    assert_equal(Currency.new(12.79, :AUD), Currency_Converter.new.convert(object1, :AUD ))
  end

  def test_unknown_currency_error_when_trying_to_convert_to_unknown_currency
    object1 = Currency.new(10, :USD)
    assert_raises(*UnknownCurrencyCodeError) {Currency_Converter.new.convert(object1, :CUP)}
  end

end
