# frozen_string_literal: true

require_relative "application_service/version"
require "active_model"

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
  #   class Sum < ApplicationService::Base
  #     attr_accessor :number_a, :number_b
  #
  #     validates :number_a, :number_b, presence: true, numericality: { only_integer: true, greater_than: 0 }
  #
  #     def initialize(number_a, number_b)
  #       super
  #
  #       self.number_a = number_a
  #       self.number_b = number_b
  #     end
  #
  #     def call
  #       (number_a + number_b)
  #     end
  #   end
  #
  #   sum = Sum.call(1, 2) # 2
  #
  # The `call` method can accept any number of arguments,
  # which are passed to the initializer of the service object.
  class Base
    include ::ActiveModel::Validations

    # Initializes a new instance of the service object.
    #
    # @param args [Array] the arguments to be passed to the initializer of the service object
    # @raise [NotImplementedError] if an attempt is made to instantiate the abstract class directly
    def initialize(*_args)
      raise NotImplementedError, "#{self.class} can not be instantiated" if instance_of?(Base)
    end

    # Initializes a new instance of the service object and invokes its `call` method.
    #
    # @param args [Array] the arguments to be passed to the initializer of the service object
    # @return [Object] the recently instantiated service object
    def self.call(*args)
      service = new(*args)

      return false unless service.valid?

      service.call
    end

    # Encapsulates the implementation to be executed by the service object.
    #
    # @raise [NotImplementedError] if the method is not implemented in a child class
    def call
      raise NotImplementedError, "The `call` method must be implemented in #{self.class}"
    end
  end
end
