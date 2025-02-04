# frozen_string_literal: true

require_relative "application_service/version"

# The ApplicationService module serves as a namespace for service objects.
# Service objects encapsulate business logic and are typically used to
# perform a single action or a series of related actions.
module ApplicationService
  # The Base class within the ApplicationService module provides a standard
  # interface for calling service objects. It defines a class method `call`
  # that initializes a new instance of the service object and invokes its
  # `call` instance method.
  #
  # Example usage:
  #   class MyService < ApplicationService::Base
  #     def initialize(param1, param2)
  #       @param1 = param1
  #       @param2 = param2
  #     end
  #
  #     def call
  #       # perform the service action
  #     end
  #   end
  #
  #   result = MyService.call(arg1, arg2)
  #
  # The `call` method can accept any number of arguments,
  # which are passed to the initializer of the service object.
  class Base
    # Initializes a new instance of the service object.
    #
    # @param args [Array] the arguments to be passed to the initializer of the service object
    # @raise [NotImplementedError] if an attempt is made to instantiate the abstract class directly
    def initialize(*_args)
      raise NotImplementedError, "#{self.class} is an abstract class and cannot be instantiated" if instance_of?(Base)
    end

    # Initializes a new instance of the service object and invokes its `call` method.
    #
    # @param args [Array] the arguments to be passed to the initializer of the service object
    # @return [Object] the result of the service object's `call` method
    def self.call(*args)
      new(*args).call
    end

    # Encapsulates the implementation to be executed by the service object.
    #
    # @raise [NotImplementedError] if the method is not implemented in a child class
    def call
      raise NotImplementedError, "The `call` method must be implemented in #{self.class}"
    end
  end
end
