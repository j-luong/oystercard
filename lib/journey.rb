require_relative 'station'

class Journey

	MIN_FARE = 1
	PENALTY_FARE = 6
	attr_reader :entry_station
	attr_reader :exit_station

	def start_journey(entry_station)
		# raise "Error: this is not a valid station." unless entry_station.is_a?(Station)
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

	def zones_crossed
		(@entry_station.zone - @exit_station.zone).abs
	end
end
