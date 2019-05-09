class Journey
  attr_reader :journey

  def initialize
    @journey = {}
    @entry_station = nil

  end

  def in_journey?
    @entry_station != nil
  end

end
