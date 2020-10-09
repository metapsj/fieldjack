
require 'rinda/rinda'

include Rinda

puts "producer is starting..."

tuplespace = DRbObject.new(nil, 'druby://localhost:4000')

topic = :xtopic 

loop do
  sleep 1
  message = rand(100)
  puts "topic: #{topic}, message: #{message}"
  tuplespace.write([topic, message])
end

