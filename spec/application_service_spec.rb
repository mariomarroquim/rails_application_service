# frozen_string_literal: true

RSpec.describe ApplicationService do
  it "has a version number" do
    expect(ApplicationService::VERSION).not_to be nil
  end

  describe ApplicationService::NotImplementedError do
    it "is a StandardError, so a plain rescue catches it" do
      expect(described_class).to be < StandardError
    end
  end

  describe ApplicationService::Base do
    it "cannot be instantiated directly" do
      expect { described_class.new }
        .to raise_error(ApplicationService::NotImplementedError, /abstract class/)
    end

    it "cannot be instantiated directly, even with attributes" do
      expect { described_class.new(name: "any") }
        .to raise_error(ApplicationService::NotImplementedError, /abstract class/)
    end

    it "cannot be called directly" do
      expect { described_class.call }
        .to raise_error(ApplicationService::NotImplementedError, /abstract class/)
    end

    context "when a subclass does not implement #call" do
      let(:service_class) { Class.new(described_class) }

      it "can be instantiated" do
        expect(service_class.new).to be_a(described_class)
      end

      it "raises when called through .call" do
        expect { service_class.call }
          .to raise_error(ApplicationService::NotImplementedError, /must be implemented/)
      end

      it "raises when #call is invoked on an instance" do
        expect { service_class.new.call }
          .to raise_error(ApplicationService::NotImplementedError, /must be implemented/)
      end

      it "names the anonymous class in the error message" do
        expect { service_class.call }
          .to raise_error(ApplicationService::NotImplementedError, /must be implemented in #<Class:0x\h+>/)
      end
    end

    context "when a subclass receives an unknown attribute" do
      let(:service_class) do
        Class.new(described_class) do
          attr_accessor :name

          def call
            name
          end
        end
      end

      it "raises ActiveModel::UnknownAttributeError" do
        expect { service_class.call(nam: "typo") }
          .to raise_error(ActiveModel::UnknownAttributeError)
      end
    end

    context "when a subclass returns a falsy value from #call" do
      it "returns false as is" do
        service_class = Class.new(described_class) { def call = false }
        expect(service_class.call).to eq(false)
      end

      it "returns nil as is" do
        service_class = Class.new(described_class) { def call = nil }
        expect(service_class.call).to be_nil
      end
    end
  end
end
