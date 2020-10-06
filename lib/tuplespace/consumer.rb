
require 'rinda/rinda'

include Rinda

puts "consumer is starting..."

tuplespace = DRbObject.new(nil, 'druby://localhost:4000')

topic = :xtopic

loop do
  begin
    puts tuplespace.read([topic, nil])
  rescue Exception => e
    puts e.message
  end
end

