MAX_BALANCE = 90
MINIMUM_FARE = 1
DEFAULT_BALANCE = 0

# in lib/oystercard.rb

class Oystercard
  attr_reader :balance, :entry_station, :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @journey = {}
  end

  def top_up(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if exceeded_limit?(amount)
    @balance += amount
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station = nil) # set as no class is created
    raise 'Insufficient funds' if insufficient_funds?
    @entry_station = station  #  station = Station.new
    @journey[:entry_station] = station
    @journey[:exit_station] = "haven't touched out yet"
  end

  def touch_out(station = nil)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @journey[:exit_station] = station
  end

  private

  def exceeded_limit?(amount)
    @balance + amount > MAX_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(amount)
    @balance -= amount
  end
end
