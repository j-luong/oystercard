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
		return 1 if !entry_station.nil? && !exit_station.nil?
		return 6
	end
end
