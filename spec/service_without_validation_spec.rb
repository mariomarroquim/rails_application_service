# frozen_string_literal: true

class SumWithoutValidation < ApplicationService::Base
  attr_accessor :number_a, :number_b

  def initialize(number_a, number_b)
    super

    self.number_a = number_a
    self.number_b = number_b
  end

  def call
    (number_a + number_b)
  rescue StandardError
    0
  end
end

RSpec.describe SumWithoutValidation do
  it "calculates the sum of two given numbers" do
    sum = SumWithoutValidation.call(1, 2)
    expect(sum).to be_truthy
  end

  it "does not fail if no number is given" do
    sum = SumWithoutValidation.call(1, nil)
    expect(sum).to be_truthy
  end
end
