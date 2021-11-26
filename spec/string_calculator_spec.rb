require_relative '../string_calculator'

RSpec.describe StringCalculator do
  before(:all) do
    @calculator = StringCalculator.new
  end

  it 'should return 0 for an empty string input' do
    ans = @calculator.add('')
    expect(ans).to eq(0)
  end

  it "should return 1 for '1' input" do
    ans = @calculator.add('1')
    expect(ans).to eq(1)
  end

  it "should return 3 for '1,2' input" do
    ans = @calculator.add('1,2')
    expect(ans).to eq(3)
  end

  it "should return 3.2 for '1.1,2.1'" do
    ans = @calculator.add('1.1,2.1')
    expect(ans).to eq(3.2)
  end

  it "should return -1.2 for '1.1,-2.3'" do
    ans = @calculator.add('1.1,-2.3')
    expect(ans).to eq(-1.2)
  end

  it 'should be able to handle an unknown amount of numbers' do
    numbers = [1] * 100
    ans = @calculator.add(numbers.join(','))
    expect(ans).to eq(numbers.reduce(:+))
  end

  it 'should be able to handle newlines between numbers' do
    ans = @calculator.add('1\n2,3')
    expect(ans).to eq(6)
  end
end
