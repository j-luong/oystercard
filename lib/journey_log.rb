require_relative 'journey'

class JourneyLog

  attr_reader :start, :end, :journeys, :journey

  def initialize(journey_class: Journey)
    @journeys = []
    @journey_class = journey_class
    new_journey
  end

  def start_journey(entry_station)
		@journey.start_journey(entry_station)
	end

	def end_journey(exit_station)
		@journey.end_journey(exit_station)
	end

	def in_journey?
    @journey.in_journey?
	end

  def fare
    @journey.fare
  end

  def store_journey
    @journeys << @journey
    new_journey
  end

private

  def new_journey
    @journey = @journey_class.new
  end

end
