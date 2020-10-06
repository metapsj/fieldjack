
require 'drb/drb'

puts "queue service is starting..."

queue = Queue.new

DRb.start_service('druby://localhost:9999', queue)
DRb.thread.join

