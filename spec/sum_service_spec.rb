# frozen_string_literal: true

class SumService < ApplicationService::Base
  attr_accessor :number_a, :number_b

  validates :number_a, :number_b, presence: true, numericality: { greater_than: 0 }

  def call
    number_a + number_b
  end
end

RSpec.describe SumService do
  it "calculates the sum of two given numbers" do
    sum = SumService.call(number_a: 1, number_b: 2)
    expect(sum).to eq(3)
  end

  it "fails if no number is given" do
    sum = SumService.call(number_a: 1, number_b: nil)
    expect(sum).to be_falsey
  end

  it "fails if zero is given" do
    sum = SumService.call(number_a: 1, number_b: 0)
    expect(sum).to be_falsey
  end

  it "fails if a negative number is given" do
    sum = SumService.call(number_a: 1, number_b: -2)
    expect(sum).to be_falsey
  end
end
