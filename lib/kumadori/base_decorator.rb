module Kumadori
  #
  # This class is base class for decorator.
  # If it is not defined decorator for target instance,
  # the instance is decorated by BaseDecorator class.
  #
  # If you want to defined that all decorated instance use method,
  # you should override BaseDecorator class and defined it.
  #
  #
  class BaseDecorator < ::SimpleDelegator
  end
end
