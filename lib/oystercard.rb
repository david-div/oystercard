require_relative './station'
require_relative './journey'

MAX_BALANCE = 90
DEFAULT_BALANCE = 0

# in lib/oystercard.rb

class Oystercard
  attr_reader   :balance, :trip_history
  attr_accessor :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @trip_history = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if exceeded_limit?(amount)
    @balance += amount
  end

  def in_journey?
    !!@journey
  end

  def touch_in(station = nil) # set as no class is created
    raise 'Insufficient funds' if insufficient_funds?
    deduct(@journey.fare) if @journey != nil
    @trip_history << @journey if @journey != nil
    @journey = Journey.new(station)
  end

  def touch_out(station = nil)
    @journey = Journey.new if @journey.nil?
    @journey.end_journey(station)
    deduct(@journey.fare)
    @trip_history << @journey
    @journey = nil
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
