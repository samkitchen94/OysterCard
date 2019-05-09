class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :journey
  # def balance
  #   @value
  # end
  def initialize
    @balance = DEFAULT_BALANCE
    @max_bal = MAX_BALANCE
    @entry_station = nil
    @exit_station = nil
    @journey = {}
  end

  def top_up(amount)
    fail "Max balance £90" if @balance + amount > @max_bal
    @balance += amount
    return @balance
  end

  def touch_in(station)
    fail "In journey, can't touch in again" if in_journey?
    fail "insufficient balance" if @balance < MIN_FARE

    @entry_station = station
  end

  def touch_out(exit_station)
    fail "Already touched out" if in_journey? == false

    deduct(MIN_FARE)

    @exit_station = exit_station
    log_journey
    @journey
  end

  def in_journey?
    @entry_station != nil
  end

  def log_journey
    @journey[@entry_station] = @exit_station
    @entry_station = nil
    @exit_station = nil
  end

private
  def deduct(fare)
    # fail "please top up, minimum balance reached" if @balance - fare <= DEFAULT_BALANCE
    @balance -= MIN_FARE
    return @balance
  end

end
