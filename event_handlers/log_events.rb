require 'yaml'

module Basilico
  module Handlers
    class LogEvents < Basilico::EventHandler

      Basilico::EVENTS.each do |event|
        define_method(event) do |options|
          log(event, options)
        end
      end

    private

      def log(event, options)
        File.open(File.expand_path("~/pomodoro.log"), "a") do |f|
          f.puts "[#{Time.now}] #{event.tr('_', ' ').capitalize}"
          f.puts YAML.dump(options).gsub(/\A--- \n/, '').gsub(/^/, '  ') unless options.empty?
        end
      end

    end
  end
end
