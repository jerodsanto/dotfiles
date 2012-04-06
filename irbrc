# Jerod Santo's irb settings

require "rubygems"

begin
  require "awesome_print"

  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError
  puts "*** awesome_print disabled ***"
  require "pp"
end

begin
  require "interactive_editor"
rescue LoadError
  puts "*** interactive_editor disabled ***"
end

# quick benchmarking
# based on rue's irbrc => http://pastie.org/179534
def bm(repetitions=100, &block)
  require "benchmark"

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
  nil
end

# send Rails logs to console
# 2.X
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  Object.const_set 'RAILS_DEFAULT_LOGGER', Logger.new(STDOUT)
end
# 3.0.X
if defined? Rails::Console and Rails::VERSION::MINOR < 1
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

begin
  require "pry"
  Pry.start
  exit
rescue LoadError
  puts "*** pry disabled ***"
end
