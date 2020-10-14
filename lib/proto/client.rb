#!/usr/bin/env ruby

require 'socket'

class ProtoClient

  attr_reader :host, :port

  def initialize(host, port)
    @host = host
    @port = port
  end

  def request
    @client = TCPSocket.new(host, port)
    listen
    send
  end

  def listen
    Thread.new do
      loop do
        puts "====#{@client.gets}"
      end
    end
  end

  def send
    Thread.new do
      loop do
        message = $stdin.gets.chomp
        @client.puts(message)
      end
    end.join
  end

end


client = ProtoClient.new('localhost', 4002)
client.request

