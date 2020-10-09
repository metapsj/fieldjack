
require 'drb/drb'

DRb.start_service()
timer = DRbObject.new_with_uri('druby://localhost:22337')

timer.tick_handler { |count| puts "testing...#{count}" }
timer.start

