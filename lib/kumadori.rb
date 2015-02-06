require "kumadori/version"
require "rubygems"
require "delegate"
require "active_support/core_ext/string/inflections"
require "kumadori/base_decorator"

module Kumadori
  def self.decorate(arg)
    decorator_class(arg).new(arg)
  end

  def self.collection_decorate(args)
    args.map{ |e| self.decorate(e) }
  end

  def self.decorator_class(args)
    class_name = args.class.to_s
    decorator_name = "#{class_name}Decorator"
    begin
      return decorator_name.constantize
    rescue NameError
      return BaseDecorator
    end
  end
end
