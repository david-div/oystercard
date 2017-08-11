require_relative './station'
require_relative './journey'
require_relative './oystercard'

class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class

  end

  def start(station)
    # station.station_in
    Journey.new(station)
  end



end
