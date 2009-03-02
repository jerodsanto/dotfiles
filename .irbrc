# Jerod Santo's irb settings
# load libraries
require 'rubygems'
require 'pp'
require 'wirble'

# start wirble (with color)
Wirble.init
Wirble.colorize


# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end


# includes Rails routes helpers
def rails_routes
  include ActionController::UrlWriter
  default_url_options[:host] = 'example.com'
end
