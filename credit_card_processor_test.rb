require 'minitest/autorun'
require './credit_card_processor.rb'

class CreditCardProcessorTest < Minitest::Test
  def setup
    @processor = CreditCardProcessor.new
  end

  def test_add_card
    @processor.process_line("Add Tom 4111111111111111 $1000")
    assert_equal ["Tom: $0"], @processor.summary
  end
end