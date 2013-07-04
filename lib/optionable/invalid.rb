# encoding: utf-8
module Optionable
  class Invalid < RuntimeError

    attr_reader :key, :value, :allowed

    def initialize(key, value, allowed)
      @key = key
      @value = value
      @allowed = allowed
      super(generate_message)
    end

    def generate_message
      "#{value.inspect} is not acceptable for option #{key.inspect}. " +
      "Valid values are: #{allowed.map(&:inspect).join(", ")}."
    end
  end
end
