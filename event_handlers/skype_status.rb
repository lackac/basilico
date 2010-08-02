require 'basilico/app_helpers'

module Basilico
  module Handlers
    class SkypeStatus < Basilico::EventHandler

      include Basilico::AppHelpers

      def initialize
        @skype = find_running_app_by_name("Skype")
      end

      def start(options={})
        return unless running?
        set_status "dnd"
        set_status_message "in a Pomodoro"
      end

      def end(options={})
        return unless running?
        set_status "online"
        set_status_message ""
      end
      alias_method :reset, :end

    private

      def running?
        !!@skype
      end

      def set_status(status)
        @skype.sendCommand("set userstatus #{status}", scriptName: "basilico")
      end

      def set_status_message(message)
        @skype.sendCommand("set profile mood_text #{message}", scriptName: "basilico")
      end

    end
  end
end
