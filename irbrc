# Jerod Santo's irb settings
require "rubygems"
require "benchmark"

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

# quick benchmarking based on http://pastie.org/179534
def bm repetitions=100, &block
  Benchmark.bmbm do |b|
    b.report { repetitions.times &block }
  end
  nil
end

if defined? ActiveRecord
  def hijack user, finder="email", pass="test1234"
    if !user.is_a? User
      user = User.send "find_by_#{finder}", user
    end

    if user.update_attributes :password => pass, :password_confirmation => pass
      user
    end
  end
end

# send Rails logs to console
# 2.X
if ENV.include?("RAILS_ENV") && !Object.const_defined?("RAILS_DEFAULT_LOGGER")
  require "logger"
  Object.const_set "RAILS_DEFAULT_LOGGER", Logger.new(STDOUT)
end
# 3.0.X
if defined? Rails::Console and Rails::VERSION::MINOR < 1
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
