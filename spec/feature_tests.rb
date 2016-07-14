require './lib/oystercard'

p card = Oystercard.new
p card.top_up(90)

p aldgate_east = Station.new("Aldgate East", 1)
p aldgate = Station.new("Aldgate", 1)

puts "touch in, touch out, and card"
p card.touch_in(aldgate)
p card.touch_out(aldgate_east)
p card

puts "touch in, touch out, and card"
p card.touch_in(aldgate_east)
p card.touch_out(aldgate)
p card

puts "double touch in and card"
p card.touch_in(aldgate)
p card.touch_in(aldgate_east)
p card

puts "touch out & card"
p card.touch_out(aldgate)
p card

puts "touch out and card"
p card.touch_out(aldgate_east)
p card