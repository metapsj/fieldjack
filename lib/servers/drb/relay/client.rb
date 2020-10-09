
require 'drb/drb'

puts "client is starting..."

DRb.start_service()

client = DRbObject.new_with_uri('druby://localhost:22337')

client.receive_handler { |message| puts "#{message}" }

