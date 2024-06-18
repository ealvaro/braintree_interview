class CreditCard
  attr_reader :name, :number, :limit, :balance

  def initialize(name, number, limit)
    @name = name
    @number = number
    @limit = limit
    @balance = 0
  end

  def valid?
    luhn_check(@number)
  end

  private

  def luhn_check(number)
    digits = number.chars.map(&:to_i)
    sum = digits.reverse.each_slice(2).flat_map { |x, y| [x, (y || 0) * 2] }.sum { |x| x > 9 ? x - 9 : x }
    sum % 10 == 0
  end
end