
require 'drb/drb'
require_relative 'component'

puts "timer service starting..."

timer = Timer.new

DRb.start_service('druby://localhost:22337', timer)
DRb.thread.join


