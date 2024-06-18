require "./credit_card.rb"

class CreditCardProcessor
  def initialize
    @cards = {}
  end

  def process_line(line)
    parts = line.split
    command = parts[0]
    case command
    when "Add"
      name, number, limit = parts[1], parts[2], parts[3][1..-1].to_i
      @cards[name] = CreditCard.new(name, number, limit)
    when "Charge"
      name, amount = parts[1], parts[2][1..-1].to_i
      @cards[name]&.charge(amount)
    when "Credit"
      name, amount = parts[1], parts[2][1..-1].to_i
      @cards[name]&.credit(amount)
    end
  end

  def summary
    @cards.keys.sort.map do |name|
      card = @cards[name]
      if card.valid?
        "#{name}: $#{card.balance}"
      else
        "#{name}: error"
      end
    end
  end
end
