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

  def test_invalid_card
    @processor.process_line("Add Quincy 1234567890123456 $2000")
    assert_equal ["Quincy: error"], @processor.summary
  end

  def test_charge_within_limit
    @processor.process_line("Add Tom 4111111111111111 $1000")
    @processor.process_line("Charge Tom $500")
    assert_equal ["Tom: $500"], @processor.summary
  end

  def test_charge_over_limit
    @processor.process_line("Add Tom 4111111111111111 $1000")
    @processor.process_line("Charge Tom $1500")
    assert_equal ["Tom: $0"], @processor.summary
  end

  def test_credit
    @processor.process_line("Add Tom 4111111111111111 $1000")
    @processor.process_line("Charge Tom $500")
    @processor.process_line("Credit Tom $200")
    assert_equal ["Tom: $300"], @processor.summary
  end

  def test_summary_order
    @processor.process_line("Add Tom 4111111111111111 $1000")
    @processor.process_line("Add Lisa 5454545454545454 $3000")
    @processor.process_line("Charge Tom $500")
    @processor.process_line("Credit Lisa $100")
    assert_equal ["Lisa: $-100", "Tom: $500"], @processor.summary
  end
end
