require 'journey'

describe Journey do
  describe '#initialization' do
    subject { described_class.new }
  end

  min_fare = Journey::MIN_FARE
  penalty_fare = Journey::PENALTY_FARE

  # describe 'journey' do
  #   it { is_expected.respond_to(:journey) }
  # end

  describe '#start_journey' do
    it { is_expected.to(respond_to(:start_journey).with(1).argument) }

    it 'stores the entry station' do
      subject.start_journey(:entry_station)
      expect(subject.entry_station).to eq(:entry_station)
    end
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

    it 'should return fare for completed journey' do
      subject.start_journey(:start_station)
      subject.end_journey(:end_station)
      expect(subject.fare).to eq(min_fare)
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

end
