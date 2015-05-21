class Currency
  attr_accessor :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    other.is_a?(Currency) && (other.amount == self.amount) && (other.code == self.code)
  end













end
