MINIMUM_FARE = 1
PENALTY_FARE = 6

class Journey

  attr_reader :station_in, :station_out

  def initialize(station_in = nil)
    @station_in = station_in
    @station_out = nil
  end

  def end_journey(station)
    @station_out = station
  end

  def fare
    return PENALTY_FARE if @station_out.nil? || @station_in.nil?
    MINIMUM_FARE
  end

end
