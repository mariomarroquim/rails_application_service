# frozen_string_literal: true

require_relative "application_service/version"
require "active_model"

# The ApplicationService module serves as a namespace for service objects.
# Service objects encapsulate business logic and are typically used to
# perform a single action or a series of related actions.
module ApplicationService
  # The Base class within the ApplicationService module provides a standard
  # interface for calling service objects with robust type handling and validations.
  # It leverages ActiveModel::API for initialization with keyword arguments,
  # ActiveModel::Attributes for type casting, and ActiveModel::Validations for
  # input validation.
  #
  # Example usage:
  #
  #   class Sum < ApplicationService::Base
  #     attribute :number_a, :integer
  #     attribute :number_b, :integer
  #
  #     validates :number_a, :number_b, presence: true, numericality: { greater_than: 0 }
  #
  #     def call
  #       number_a + number_b
  #     end
  #   end
  #
  #   sum = Sum.call(number_a: 1, number_b: 2) # => 3
  #
  # This gem supports the following attribute types through ActiveModel::Attributes and
  # other custom types defined in ActiveModel::Type:
  #
  # - :boolean
  # - :date
  # - :datetime
  # - :decimal
  # - :float
  # - :integer
  # - :string
  # - :time
  class Base
    include ::ActiveModel::API
    include ::ActiveModel::Attributes
    include ::ActiveModel::Validations

    # Initializes a new instance of the service object.
    #
    # @param kwargs [Hash] the attributes to be passed to the service object
    # @raise [NotImplementedError] if an attempt is made to instantiate the Base class directly
    def initialize(**kwargs)
      super

      return unless instance_of?(Base)

      raise ::NotImplementedError, "#{self.class.name} is an abstract class and cannot be instantiated directly"
    end

    # Initializes a new instance of the service object and invokes its `call` method.
    #
    # @param kwargs [Hash] the attributes to be passed to the service object
    # @return [Object] the result of the service object's call method
    # @return [false] if the service object is invalid
    def self.call(**kwargs)
      service = new(**kwargs)

      return false unless service.valid?

      service.call
    end

    # Encapsulates the implementation to be executed by the service object.
    #
    # @raise [NotImplementedError] if the method is not implemented in a child class
    def call
      raise ::NotImplementedError, "The `call` method must be implemented in #{self.class.name}"
    end
  end
end
