
require 'drb/drb'
require_relative 'component'

puts "broker service starting..."

relay = relay.new

DRb.start_service('druby://localhost:22337', relay)
DRb.thread.join

