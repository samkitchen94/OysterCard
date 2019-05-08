class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance
  attr_accessor :in_journey
  # def balance
  #   @value
  # end

  def initialize
    @balance = DEFAULT_BALANCE
    @max_bal = MAX_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance £90" if @balance + amount > @max_bal
    @balance += amount
    return @balance
  end

  def touch_in
    fail "In journey, can't touch in again" if @in_journey == true
    fail "insufficient balance" if @balance < MIN_FARE

    @in_journey = true
    return @in_journey
  end

  def touch_out
    fail "Already touched out" if @in_journey == false

    @in_journey = false
    deduct(MIN_FARE)
  end

  def in_journey?
    @in_journey
  end

private
  def deduct(fare)
    # fail "please top up, minimum balance reached" if @balance - fare <= DEFAULT_BALANCE
    @balance -= MIN_FARE
    return @balance
  end

end
