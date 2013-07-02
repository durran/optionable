require "spec_helper"

describe Optionable do

  class Model
    include Optionable

    option(:read).allows(:primary, :secondary)
    option(:write).allows(TypeOf.new(Integer))

    def initialize(options = {})
      validate_strict(options)
    end
  end

  describe "#validate_strict" do

    context "when options are empty" do

      it "does not raise an error" do
        expect {
          Model.new
        }.to_not raise_error
      end
    end

    context "when options are nil" do

      it "does not raise an error" do
        expect {
          Model.new(nil)
        }.to_not raise_error
      end
    end

    context "when the options are valid" do

      context "when options are allowed specific values" do

        it "does not raise an error for any value" do
          expect {
            Model.new(read: :primary)
            Model.new(read: :secondary)
          }.to_not raise_error
        end
      end

      context "when options allow types" do

        it "does not raise an error for correct type" do
          expect {
            Model.new(write: 10)
          }.to_not raise_error
        end
      end
    end

    context "when the options are not valid" do

      context "when options are allowed specific values" do

        it "raises an error for any bad value" do
          expect {
            Model.new(read: :tertiary)
          }.to raise_error(Optionable::Invalid)
        end
      end

      context "when options allow types" do

        it "raises an error for incorrect type" do
          expect {
            Model.new(write: 14.5)
          }.to raise_error(Optionable::Invalid)
        end
      end
    end
  end
end
