# Jerod Santo's irb settings
# load libraries
require 'pp'
require 'rubygems'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "*** wirble disabled ***"
end

begin
  require 'ap'

  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError
  puts "*** awesome_print disabled ***"
end

begin
  require 'interactive_editor'
rescue LoadError
  puts "*** interactive_editor disabled ***"
end


# Methods that are defined directly on this object's class
class Object
  def local_methods
    (methods - self.class.superclass.instance_methods).sort
  end
end


# includes Rails routes helpers
def rails_routes
  include ActionController::UrlWriter
  default_url_options[:host] = 'example.com'
end

# Quick benchmarking
# Based on rue's irbrc => http://pastie.org/179534
def bm(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
  nil
end

# Toggle Rails logger to console and back to default
def rails_log_to_console(toggle)
  ActiveRecord::Base.logger = (toggle == true) ? Logger.new(STDOUT) : RAILS_DEFAULT_LOGGER
  reload!
end
