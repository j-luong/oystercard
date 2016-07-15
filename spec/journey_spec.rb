require 'journey'

describe Journey do
  describe '#initialization' do
    subject { described_class.new }
  end

  min_fare = Journey::MIN_FARE
  penalty_fare = Journey::PENALTY_FARE

  let(:entry_station){ double(:entry_station, name: "Aldgate", zone: 1) }
  let(:exit_station){ double(:exit_station, name: "Aldgate East", zone: 1) }
  let(:station_class) { Station.new("Aldgate", 1) } #VERY SMELLY
  # let(:stn) { class_double("Station") }
  # allow(stn).to receive(:is_a?).and_return("Station")

  describe '#start_journey' do
    it { is_expected.to(respond_to(:start_journey).with(1).argument) }
    it 'stores the entry station' do
      # allow(Station).to receive(:new).and_return(Station)
      # entry_station = class_double("Station")
      subject.start_journey(station_class)
      expect(subject.entry_station).to eq(station_class)
      # subject.start_journey(stn)
      # expect(subject.entry_station).to eq(stn)
    end

    # it 'take a Station object as an agurment' do
    #   expect{ subject.start_journey("string") }.to raise_error("Error: this is not a valid station.")
    # end
  end

  describe '#end_journey' do
    it { is_expected.to(respond_to(:end_journey).with(1).argument) }

    it 'stores the exit station' do
      subject.end_journey(:exit_station)
      expect(subject.exit_station).to eq(:exit_station)
    end
  end

  describe '#in_journey' do
    it { is_expected.to(respond_to(:in_journey?)) }

    it 'not in journey when entry_station = nil' do
      expect(subject).not_to(be_in_journey)
    end

    it 'is in journey when entry_station has value' do
      subject.start_journey(:entry_station)
      expect(subject).to(be_in_journey)
    end

    it 'is not in journey when journey is complete' do
      subject.start_journey(:entry_station)
      subject.end_journey(:exit_station)
      expect(subject).not_to(be_in_journey)
    end
  end

  describe '#fare' do
    it { is_expected.to(respond_to(:fare)) }

    context 'journeys in the same zone' do
      it 'should return fare for completed journey' do
        subject.start_journey(entry_station)
        subject.end_journey(exit_station)
        expect(subject.fare).to eq(1)
      end
    end

    it 'should return penalty fare for incomplete journey' do
      subject.start_journey(:start_station)
      expect(subject.fare).to eq(penalty_fare)
    end

    it 'should return penalty fare for incomplete journey' do
      subject.end_journey(:end_station)
      expect(subject.fare).to eq(penalty_fare)
    end
  end

  # describe '#zones_crossed' do
  #   it { is_expected.to(respond_to(:zones_crossed)) }
  #
  #   context 'entry and exit stations in the same zone' do
  #     it 'should calculate the zones crossed between entry_station and exit_station' do
  #       subject.start_journey(entry_station)
  #       subject.end_journey(exit_station)
  #       expect(subject.zones_crossed).to eq(0)
  #     end
  #   end
  # end

end
