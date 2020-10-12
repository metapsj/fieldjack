#!/usr/bin/env ruby

require 'rinda/rinda'

class TupleSpaceClient
  include Rinda

  def initialize
    tuplespace = DRbObject.new(nil, 'druby://localhost:4000')
  end

  def start
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
  end

end

