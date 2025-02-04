# frozen_string_literal: true

RSpec.describe ApplicationService do
  it "has a version number" do
    expect(ApplicationService::VERSION).not_to be nil
  end

  it "raises an error when attempting to instantiate the abstract class" do
    expect { ApplicationService::Base.new }.to raise_error(NotImplementedError, "ApplicationService::Base is an abstract class and cannot be instantiated")
  end
end
