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
    end
  end

  def summary
    @cards.keys.sort.map do |name|
      card = @cards[name]
      "#{name}: $#{card.balance}"
    end
  end  
end
