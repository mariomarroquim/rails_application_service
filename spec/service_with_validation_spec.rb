# frozen_string_literal: true

class SumWithValidation < ::ApplicationService::Base
  attribute :number_a, :integer
  attribute :number_b, :integer

  validates :number_a,
            :number_b, 
            presence: true,
            numericality: { 
              greater_than: 0
            }

  def call
    number_a + number_b
  rescue ::StandardError
    0
  end
end

RSpec.describe SumWithValidation do
  it "calculates the sum of two given number" do
    sum = SumWithValidation.call(number_a: 1, number_b: 2)
    expect(sum).to eq(3)
  end

  it "fails if no number is given" do
    sum = SumWithValidation.call(number_a: nil, number_b: nil)
    expect(sum).to be_falsey
  end
end
