#!/usr/bin/env ruby

require 'rinda/tuplespace'

tuplespace = Rinda::TupleSpace.new

puts 'tuplespace is starting...'
DRb.start_service('druby://localhost:4000', tuplespace)

puts "tuplespace is listening on... #{DRb.uri}"
DRb.thread.join

