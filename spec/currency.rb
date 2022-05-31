require_relative '../currency'

RSpec.describe Money do
  it 'should return a 10-dollar when multiply 5-dollar to 2, and 15-dollar when multiply 5-dollar to 3' do
    five = Money.dollar(5)
    product = five.times(2)
    expect(product).to eq(Money.dollar(10))
    product = five.times(3)
    expect(product).to eq(Money.dollar(15))
  end

  it 'should return True when comparing 2 5-dollar' do
    expect(Money.dollar(5)).to eq(Money.dollar(5))
  end

  it 'should return False when comparing 2 a 5-dollar to a 7-dollar with different amount' do
    expect(Money.dollar(5) == Money.dollar(7)).to be(false)
  end

  it 'should return a 10-franc when multiply 5-franc to 2, and 15-franc when multiply 5-franc to 3' do
    five = Money.franc(5)
    product = five.times(2)
    expect(product).to eq(Money.franc(10))
    product = five.times(3)
    expect(product).to eq(Money.franc(15))
  end

  it 'should return False when comparing 5-franc and 5-dollar' do
    expect(Money.dollar(5) == Money.franc(5)).to be(false)
  end
end
