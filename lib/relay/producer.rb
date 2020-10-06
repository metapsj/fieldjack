
require 'drb/drb'

puts "producer is starting..."

DRb.start_service()

producer = DRbObject.new_with_uri('druby://localhost:22337')

producer.publish_handler { |message| puts "#{message}" }
producer.publish("testing...")

