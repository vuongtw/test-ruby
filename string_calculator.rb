class StringCalculator
  PRECISION = 10

  class Error < StandardError; end
  class InvalidNumbersStringError < Error; end

  def add(numbers, precision: PRECISION)
    return 0 if numbers.empty?

    numbers.split(',')
      .map { |n| n.split('\n') }
      .flatten
      .map(&:to_f)
      .reduce(:+)
      .round(precision)
  end
end
