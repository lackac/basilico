require 'basilico/app_helpers'

module Basilico
  module Handlers
    class Things < Basilico::EventHandler

      include Basilico::AppHelpers

      def initialize
        @things = find_running_app_by_name("Things") || begin
          # trigger launching the application without bringing it to front
          app("com.culturedcode.things").tap {|th| th.windows}
        end
      end

      def interrupt(options={})
        @things
        process = find_process("The Hit List")
        menu_bar = process.menuBars.first
        window_menu = menu_bar.menus[-2]
        quick_entry_item = window_menu.menuItems[9]
        quick_entry_item.pick
        sleep 1
        default_value = " /pomodoro_interrupt"
        input_string(default_value)
        default_value.length.times { sys_events.keyCode(0x7b, :using => 0) }
      end

    end
  end
end
