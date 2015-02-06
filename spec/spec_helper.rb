$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kumadori'

module Kumadori
  class BaseDecorator < ::SimpleDelegator
    def base_decorator_method(name)
      "goodbye, #{name}"
    end
  end
end

class CustomDecorator < Kumadori::BaseDecorator
  def custom_decorator_method(name)
    "hello #{name}"
  end

  def same_name_method
    "Call from CustomDecorator class"
  end
end

class Custom
  def custom_method(name)
    "good job, #{name}"
  end

  def same_name_method
    "Call from Custom class"
  end
end

class NotDefined
end
