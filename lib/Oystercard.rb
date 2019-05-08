class Oystercard
  DEFAULT_VALUE = 0
  MAX_BALANCE = 90
  # MIN_BALANCE = 0
  attr_reader :balance
  # def balance
  #   @value
  # end

  def initialize
    @balance = DEFAULT_VALUE
    @max_bal = MAX_BALANCE
  end

  def top_up(amount)
    fail "Max balance £90" if @balance + amount > @max_bal
    @balance += amount
    return @balance
  end

  def deduct(fare)
    @balance = @balance - fare
    return @balance
  end
end
