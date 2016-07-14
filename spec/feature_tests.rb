require './lib/oystercard'

p card = Oystercard.new
p card.top_up(90)

p aldgate_east = Station.new("Aldgate East", 1)
p aldgate = Station.new("Aldgate", 1)

puts "touch in, touch out, and card"
p card.touch_in(aldgate)
p card.touch_out(aldgate_east)
p card.balance
puts ""
puts card.journeys.count

#works fine

puts "touch in, touch out, and card"
p card.touch_in(aldgate_east)
p card.touch_out(aldgate)
p card.balance
puts ""
puts card.journeys.count

#works fine

puts "double touch in and card"
p card.touch_in(aldgate)
p card.touch_in(aldgate_east)
p card.balance
puts ""
puts card.journeys.count

puts "touch out & card"
p card.touch_out(aldgate)
p card.balance
puts ""
puts card.journeys.count

puts "touch out and card"
p card.touch_out(aldgate_east)
p card.balance
puts ""
puts card.journeys.count

puts "touch in, touch out, and card"
p card.touch_in(aldgate)
p card.touch_out(aldgate_east)
p card.balance
puts ""
puts card.journeys.count
