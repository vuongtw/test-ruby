class Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(obj)
    amount == obj.amount && self.class == obj.class
  end

  def self.dollar(amount)
    Dollar.new(amount, 'USD')
  end

  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end

  protected

  def amount
    @amount
  end
end

class Dollar < Money
  def times(multiplier)
    Money.dollar(amount * multiplier)
  end
end

class Franc < Money
  def times(multiplier)
    Money.franc(amount * multiplier)
  end
end
