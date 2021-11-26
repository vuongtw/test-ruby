require_relative '../memoization_fibonanci'

RSpec.describe Fibonanci do
  it 'returns the correct first 6 values' do
    fib = Fibonanci.new
    ans = (0..5).flat_map { |i| fib.slow_fibonanci(i) }
    expect(ans).to eq([0, 1, 1, 2, 3, 5])
  end
end
