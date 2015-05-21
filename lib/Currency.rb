class DifferentCurrencyCode < StandardError
end

class Currency
  attr_accessor :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    other.is_a?(Currency) && (other.amount == self.amount) && (other.code == self.code)
  end

  def +(other)
    if other.is_a?(Currency) && (other.code == self.code)
      @amount += other.amount
    else
      raise DifferentCurrencyCode
    end
  end

  def -(other)
    if other.is_a?(Currency) && (other.code == self.code)
      @amount -= other.amount
    else
      raise DifferentCurrencyCode
    end
  end











end
