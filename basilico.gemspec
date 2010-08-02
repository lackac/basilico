# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'basilico/version'

Gem::Specification.new do |s|
  s.name         = "basilico"
  s.version      = Basilico::VERSION
  s.authors      = ["Laszlo Bacsi"]
  s.email        = "lackac@lackac.hu"
  s.homepage     = "http://github.com/lackac/basilico"
  s.summary      = "Basilico is an event handling framework for the Mac OS X Pomodoro application"
  s.description  = "Basilico is a framework for handling Pomodoro events while also providing useful events out of the box"

  s.files        = Dir.glob("{bin,lib,event_handlers}/**/*") + %w(README.md)
  s.executables  = %w(basilico)
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.required_rubygems_version = '>= 1.3.6'
end
