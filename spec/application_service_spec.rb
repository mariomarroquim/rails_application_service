# frozen_string_literal: true

RSpec.describe ApplicationService do
  it "has a version number" do
    expect(ApplicationService::VERSION).not_to be nil
  end

  it "can not be instantiated" do
    expect { ApplicationService::Base.new }.to raise_error(NotImplementedError)
  end
end
