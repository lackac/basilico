require 'basilico/event_handler.rb'

module Basilico

  extend self

  EVENTS = %w{start interrupt interrupt_over reset resume end break_end every}

  def handlers
    @event_handlers ||= []
  end

  def add_handler(klass)
    handlers << klass
  end

  def run_all(event, *vars)
    options = parse_variables(vars.flatten)
    handlers.each do |handler|
      next unless handler.handles?(event)
      handler.new.send(event, options)
    end
  end

private

  def self.parse_variables(vars)
    vars.inject({}) do |hash, pair|
      key, value = pair.split("=")
      value = value.to_i if value =~ /\A\d+\Z/ and key != "title"
      hash[key] = value
      hash
    end
  end

end

# Load all handlers
Dir[File.join(File.dirname(__FILE__), "..", "event_handlers", "*.rb")].each do |handler|
  require(handler)
end
