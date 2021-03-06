require_relative "Currency"

class UnknownCurrencyCodeError < StandardError
end

class Currency_Converter
  attr_reader :rates

def initialize
  @rates = { "USD": 1.00, "AUD": 1.27941, "EUR": 0.90824 }
end

def convert(currency_object, new_currency_code)
  new_currency_code.to_s
  if (@rates.has_key?(new_currency_code)) && (@rates.has_key?(currency_object.code))
    new_amount = currency_object.amount * (@rates[new_currency_code]/@rates[currency_object.code])
    Currency.new(new_amount.round(2), new_currency_code)
  else
    raise UnknownCurrencyCodeError
  end
end

end
