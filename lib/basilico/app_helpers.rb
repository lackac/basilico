framework 'Foundation'
framework 'ScriptingBridge'

module Basilico
  module AppHelpers

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

  end
end
