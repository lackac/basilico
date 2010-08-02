require 'basilico/app_helpers'

module Basilico
  module Handlers
    class IChatStatus < Basilico::EventHandler

      include Basilico::AppHelpers

      ICHAT_STATUSES = {
        "available" => 1635148140,
        "away" => 1635213689,
        "invisible" => 1768846963,
        "offline" => 1868981868
      }

      def initialize
        @ichat = find_running_app_by_name("iChat")
      end

      def start(options={})
        return unless running?
        set_status "away"
        set_status_message "in a Pomodoro"
      end

      def end(options={})
        return unless running?
        set_status "available"
        set_status_message ""
      end
      alias_method :reset, :end

    private

      def running?
        !!@ichat
      end

      def set_status(status)
        status_id = ICHAT_STATUSES[status]
        @ichat.setStatus(status_id)
        # let's wait until the status has actually changed
        until @ichat.status == status_id; end
      end

      def set_status_message(message)
        @ichat.setStatusMessage(message)
      end

    end
  end
end
