framework 'Foundation'
framework 'ScriptingBridge'

module Basilico
  module AppHelpers

    KEY_CODES = {
      :shift    => 0x20102,
      :control  => 0x40101,
      :option   => 0x80120,
      :command  => 0x100108,
      :numpad   => 0x200100,
      :fn       => 0x800100,
      :cursor   => 0xa00100
    }

  private

    def app(bundle_id)
      SBApplication.applicationWithBundleIdentifier(bundle_id)
    end

    def sys_events
      @_sys_events ||= app("com.apple.SystemEvents")
    end

    def find_process(name)
      sys_events.processes.detect {|p| p.name == name}
    end

    def find_running_app_by_name(name)
      if process = find_process(name)
        app(process.bundleIdentifier)
      end
    end

    def modifiers(*modifiers)
      modifiers.inject(0) {|c,m| c | (KEY_CODES[m] || 0)}
    end

    def input_string(string)
      string.each_char {|c| sys_events.keystroke(c, :using => 0)}
    end

  end
end
