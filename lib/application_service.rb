# frozen_string_literal: true

require_relative "application_service/version"

module ApplicationService
  class Base
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end
