
require 'socket'

server = TCPServer.new(9000)

loop do
  client = server.accept
  client.puts "Hello!"
  client.puts "Time is #{Time.now}"
  client.close
end

__END__

# threaded server

loop do
  Thread.start(server.accept) do |client|
    client.puts "Hello!"
    client.puts "Time is #{Time.now}"
    client.close
  end
end

