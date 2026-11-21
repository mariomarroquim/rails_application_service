# frozen_string_literal: true

RSpec.describe ApplicationService do
  it "has a version number" do
    expect(ApplicationService::VERSION).not_to be nil
  end

  it "can not be instantiated" do
    expect { ApplicationService::Base.new }.to raise_error(ApplicationService::NotImplementedError)
  end

  it "raises a StandardError when a subclass does not implement call" do
    service_class = Class.new(ApplicationService::Base)

    expect { service_class.call }.to raise_error(StandardError, /must be implemented/)
  end
end
