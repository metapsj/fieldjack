#!/usr/bin/env ruby

require 'socket'

client = TCPSocket.new('localhost', 9090)

# read 
# write

while line = client.gets
  puts line
end

client.close

