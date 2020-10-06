
require 'drb/drb'

puts "queue consumer is starting..."

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:9999')

loop do
  data = queue.pop

  # process the data
  puts "processing... #{data}"
end

