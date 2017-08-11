require 'journey'

describe Journey do
  let(:journey) { Journey.new "Victoria" }
  let(:station) { double :station }
  let(:oystercard) { double :oystercard }

  context '#initialize' do

    it "takes a starting station" do
      expect(journey.station_in).to eq "Victoria"
    end

    it "initializes with nil if no entry station" do
      expect(Journey.new.station_in).to eq nil
    end

    it "initializes with an exit station of nil" do
      expect(journey.station_out).to be_nil
    end

  end

  context '#end_journey' do

    it "takes an end station" do
      expect(journey.end_journey(station)).to eq journey.station_out
    end

  end

  context '#fare' do
    it "returns the minimum fare" do
      journey.end_journey("london")
      expect(journey.fare).to eq MINIMUM_FARE
    end

    # it 'returns the penalty fare if you forgot to touch out' do
    #   expect(journey.fare).to eq PENALTY_FARE
    # end
    #
    # it 'returns the penalty fare if you forgot to touch in' do
    #   journey.station_in = nil
    #   journey.end_journey(station)
    #   expect(journey.fare).to eq PENALTY_FARE
    # end

  end

end
