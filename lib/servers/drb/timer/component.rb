
class Timer
  def tick_handler(&block)
    @tick_handler = block if block_given?
  end

  def start
    @started = true

    while @started
      @count ||= 0
      sleep 1
      @count += 1
      handle_tick
    end
  end

  def stop
    @started = false
  end

  private

  def handle_tick
    @tick_handler.call(@count) unless @tick_handler.nil?
  end
end

