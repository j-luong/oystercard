class Journey
	# attr_reader :journey
	MIN_FARE = 1
	PENALTY_FARE = 6
	attr_reader :entry_station
	attr_reader :exit_station

	def start_journey(entry_station)
		@entry_station = entry_station
	end

	def end_journey(exit_station)
		@exit_station = exit_station
	end

	def in_journey?
		!!entry_station && !exit_station
	end

	def fare
		return MIN_FARE if !entry_station.nil? && !exit_station.nil?
		return PENALTY_FARE
	end
end
