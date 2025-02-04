# frozen_string_literal: true

require_relative "application_service/version"

#
# The ApplicationService module serves as a namespace for service objects.
# Service objects encapsulate business logic and are typically used to
# perform a single action or a series of related actions.
#
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
# The `call` method can accept any number of arguments and an optional block,
# which are passed to the initializer of the service object.
module ApplicationService
  class Base
    # Initializes a new instance of the service object and invokes its `call` method.
    #
    # @param args [Array] the arguments to be passed to the initializer of the service object
    # @param block [Proc] an optional block to be passed to the initializer of the service object
    # @return [Object] the result of the service object's `call` method
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end
