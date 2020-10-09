
require 'drb/drb'

puts "queue producer is starting..."

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:9999')

loop do
  queue.push(rand(100))
end

