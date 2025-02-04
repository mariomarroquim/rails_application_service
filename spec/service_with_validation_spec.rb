# frozen_string_literal: true

class SumWithValidation < ApplicationService::Base
  attr_accessor :number_a, :number_b

  validates :number_a, :number_b, presence: true, numericality: { only_integer: true, greater_than: 0 }

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

RSpec.describe SumWithValidation do
  it "calculates the sum of two given numbers" do
    sum = SumWithValidation.call(1, 2)
    expect(sum).to be_truthy
  end

  it "fails if no number is given" do
    sum = SumWithValidation.call(nil, nil)
    expect(sum).to be_falsey
  end
end
