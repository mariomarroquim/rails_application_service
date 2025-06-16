# frozen_string_literal: true

class SumWithoutValidation < ApplicationService::Base
  attribute :number_a, :integer
  attribute :number_b, :integer

  validates :number_a,
            :number_b,
            presence: true

  def call
    number_a + number_b
  rescue ::StandardError
    0
  end
end

RSpec.describe SumWithoutValidation do
  it "calculates the sum of two given numbers" do
    sum = SumWithoutValidation.call(number_a: 1, number_b: 2)
    expect(sum).to eq(3)
  end

  it "does not fail if no number is given" do
    sum = SumWithoutValidation.call(number_a: 1, number_b: nil)
    expect(sum).to be_falsey
  end

  it "automatically converts string numbers to integers" do
    sum = SumWithoutValidation.call(number_a: "5", number_b: "10")
    expect(sum).to eq(15)
  end

  it "handles type conversion automatically" do
    sum = SumWithoutValidation.call(number_a: 1.5, number_b: "2.8")
    expect(sum).to eq(3)
  end
end
