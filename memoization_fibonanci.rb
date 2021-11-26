# Big O: O(2^n)
class Fibonanci
  def slow_fibonanci(n)
      if n <= 0
          return 0
      elsif n == 1
          return 1
      end
      return slow_fibonanci(n - 1) + slow_fibonanci(n - 2)
  end

  # This technique, called memoization, is a very common one to optimize exponential time recursive algorithms
  # Big O: O(n)
  def memoization_fibonanci(n, memo=[])
      if (n <= 0)
          return 0
      elsif n == 1
          return n
      elsif (memo[n])
          return memo[n]
      end
      memo[n] = memoization_fibonanci(n - 1, memo) + memoization_fibonanci(n - 2, memo)
      return memo[n]
  end
end
