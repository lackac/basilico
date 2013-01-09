#!/usr/bin/env macruby -r rubygems

require 'hotcocoa'

class PomodoroInterrupt
  include HotCocoa

  def start
    application(:name => "Pomodoro Interrupt") do |app|
      app.delegate = self
      window :frame => [100, 100, 500, 300], :title => "Pomodoro Interrupt" do |win|
        win << label(:text => "What's this interrupt about?", :layout => {:start => false})
        win.will_close { exit }
      end
    end
  end
end

PomodoroInterrupt.new.start
