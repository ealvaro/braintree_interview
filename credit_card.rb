class CreditCard
  attr_reader :name, :number, :limit, :balance

  def initialize(name, number, limit)
    @name = name
    @number = number
    @limit = limit
    @balance = 0
  end
end