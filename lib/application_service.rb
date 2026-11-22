# frozen_string_literal: true

require_relative "application_service/version"
require "active_model"

# The ApplicationService module serves as a namespace for service objects.
# Service objects encapsulate business logic and are typically used to
# perform a single action or a series of related actions.
module ApplicationService
  # The Base class within the ApplicationService module provides a standard
  # interface for calling service objects. It leverages ActiveModel for
  # initialization with keyword arguments and input validation.
  #
  # Example usage:
  #
  #   class Sum < ApplicationService::Base
  #     attr_accessor :number_a, :number_b
  #
  #     validates :number_a, :number_b, presence: true, numericality: { greater_than: 0 }
  #
  #     def call
  #       number_a + number_b
  #     end
  #   end
  #
  #   sum = Sum.call(number_a: 1, number_b: 2) # => 3
  class Base
    include ::ActiveModel::Model

    # Initializes a new instance of the service object.
    #
    # @param kwargs [Hash] The attributes to be passed to the service object.
    # @raise [NotImplementedError] if an attempt is made to instantiate the Base class directly.
    def initialize(**kwargs)
      super

      return unless instance_of?(Base)

      raise ::NotImplementedError, "#{self.class.name} is an abstract class and cannot be instantiated directly"
    end

    # Instantiates a new service object and invokes its `call` method.
    #
    # @param kwargs [Hash] The attributes to be passed to the service object.
    # @return [Object] The result of the service object's call method.
    # @return [false] If the service object is invalid.
    def self.call(**kwargs)
      service = new(**kwargs)
      return false unless service.valid?

      service.call
    end

    # Encapsulates the implementation to be executed by the service object.
    #
    # @raise [NotImplementedError] if the method is not implemented in a child class.
    def call
      raise ::NotImplementedError, "The `call` method must be implemented in #{self.class.name}"
    end
  end
end
