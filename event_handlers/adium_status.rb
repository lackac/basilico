require 'basilico/app_helpers'

module Basilico
  module Handlers
    class AdiumStatus < Basilico::EventHandler

      include Basilico::AppHelpers

      def initialize
        @adium = find_running_app_by_name("Adium")
      end

      def start(options={})
        return unless running?
        set_status_with_message "Away", "in a Pomodoro"
      end

      def end(options={})
        return unless running?
        set_status_with_message "Available", nil
      end
      alias_method :reset, :end

    private

      def running?
        !!@adium
      end

      def set_status_with_message(status, message)
        first_account = nil
        @adium.accounts.select(&:enabled).each do |account|
          #unless first_account
            account.send("go#{status}WithMessage", message)
            #first_account = account
          #else
            # This should work and works in other contexts
            # but here it throws an exception
            #account.setStatus(first_account.status)
          #end
        end
      end

    end
  end
end
