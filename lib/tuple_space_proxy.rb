#!/usr/bin/env ruby

require 'socket'
require './lib/tuple_space_client'

class TupleSpaceProxy

  def initialize
    server = TCPServer.new('localhost', 9090)
  end

  def start
    loop do
      client = server.accept

      while buffer = client.gets
        client.puts(buffer)
      end

      client.close
    end
  end

end




