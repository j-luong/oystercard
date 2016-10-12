# Oystercard challenge
The challenge was to TDD a simple Oystercard program which allows the user to make journeys by touching in/out, top-up, and store your journey history.

# Tech used
- Ruby
- RSpec
- Bundle

# Running
Clone the repo and ```bundle``` the necessary gems.

# Usage
The program is executed via command line, see below for an example use case:

```
require './lib/oystercard'

card = Oystercard.new
card.top_up(90)

aldgate_east = Station.new("Aldgate East", 1)
aldgate = Station.new("Aldgate", 1)

card.touch_in(aldgate)
card.touch_out(aldgate_east)
card.balance
puts card.journeys.count
```

# Testing
Tests can be run by using the ```rspec``` command.
