#!/usr/bin/env ruby

require 'socket'

# looping server
server = TCPServer.new('localhost', 9090)

loop do
  client = server.accept

  while buffer = client.gets
    client.puts(buffer)
  end

  client.close
end

__END__

#
# async
#
require 'async'
require 'async/io/tcp_socket'

Async do |task|
  server = Async::IO::TCPServer.new('localhost', 9090)

  loop do
    client, address = server.accept

    task.async do
      while buffer = client.gets
        client.puts(buffer)
      end

      client.close
    end
  end
end


#
# fiber server
#
require 'socket'
require 'fiber'

class Reactor
  def initialize
    @readable = {}
    @writable = {}
  end

  def run
    while @readable.any? or @writable.any?
      readable, writable = IO.select(@readable.keys, @writable.keys, [])
      readable.each { |io| @readable[io].resume }
      writable.each { |io| @writable[io].resume }
    end
  end

  def wait_readable(io)
    @readable[io] = Fiber.current
    Fiber.yield
    @readable.delete(io)
    return yield if block_given?
  end

  def wait_writable(io)
    @writable[io] = Fiber.current
    Fiber.yield
    @writable.delete(io)
    return yield if block_given?
  end
end

server = TCPServer.new('localhost', 9090)
reactor = Reactor.new

Fiber.new do
  loop do
    client = reactor.wait_readable(server) { server.accept }

    Fiber.new do
      while buffer = reactor.wait_readable(client) { client.gets }
        reactor.wait_writable(client)
        client.puts(buffer)
      end

      client.close
    end.resume
  end
end.resume

reactor.run


#
# threading server
#
require 'socket'
require 'socket'
server = TCPServer.new('localhost', 9090)

loop do
  client = server.accept

  Thread.new do
    while buffer = client.gets
      client.puts(buffer)
    end

    client.close
  end
end


#
# forking server
#
require 'socket'
server = TCPServer.new('localhost', 9090)

loop do
  client = server.accept

  fork do
    while buffer = client.gets
      client.puts(buffer)
    end

    client.close
  end

  client.close
end


