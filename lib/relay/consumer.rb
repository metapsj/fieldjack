
require 'drb/drb'

puts "consumer is starting..."

DRb.start_service()

consumer = DRbObject.new_with_uri('druby://localhost:22337')

consumer.receive_handler { |message| puts "#{message}" }


