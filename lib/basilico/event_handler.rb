module Basilico
  class EventHandler

    def self.inherited(subclass)
      Basilico.add_handler(subclass)
    end

    def self.handles?(event)
      handled_events = instance_methods(false).map(&:to_s) & Basilico::EVENTS
      handled_events.include?(event)
    end

  end
end
