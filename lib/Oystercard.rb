class Oystercard
  DEFAULT_VALUE = 0
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = DEFAULT_VALUE
    @max_bal = MAX_BALANCE
  end

  # def balance
  #   @value
  # end


  def top_up(amount)
    fail "Max balance £90" if @balance + amount > @max_bal

    @balance += amount
    return @balance
  end

end
