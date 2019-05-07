class Oystercard
  DEFAULT_VALUE = 0

  attr_reader :balance

  def initialize(value = DEFAULT_VALUE)
    @balance = value
  end

  # def balance
  #   @value
  # end

end
