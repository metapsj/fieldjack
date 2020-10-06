
require 'rinda/rinda'

include Rinda

puts "client is starting..."

tuplespace = DRbObject.new(nil, 'druby://localhost:4000')

while input = gets
  begin
    args = input.split(" ")

    method = args.shift.to_sym
    topic = args.shift.to_sym
    message = args.shift
    message = nil if message == "nil"

    tuple = [topic, message]

    puts tuplespace.send(method, tuple)
  rescue Exception => e
    puts e.message
  end
end

