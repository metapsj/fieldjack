require 'time'

class Relay

  def initialize
    # channel, consumer
    # channel, producer
    @channels = []
  end

  def receive_handler(&block)
    @receive_handler = block if block_given?
  end

  def publish_handler(&block)
    @publish_handler = block if block_given?
  end

  def publish(message)
    puts "Relay#publish"
    # handle_receive(message)
    handle_publish("#{Time.now.iso8601}")
  end

  private

  def handle_receive(message)
    puts "Relay#hande_recieve"
    @receive_handler.call(message) unless @receive_handler.nil?
  end

  def handle_publish(message)
    puts "Relay#handle_publish"
    @publish_handler.call(message) unless @publish_handler.nil?
  end

end

