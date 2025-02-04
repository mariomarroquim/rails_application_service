# frozen_string_literal: true

class TestService < ApplicationService::Base
  def initialize(param1, param2)
    super
    @param1 = param1
    @param2 = param2
  end

  def call
    @param1 + @param2
  end
end

RSpec.describe TestService do
  it "returns the sum of the two number" do
    result = TestService.call(1, 2)
    expect(result).to eq(3)
  end
end
