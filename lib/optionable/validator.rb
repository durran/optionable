# encoding: utf-8
module Optionable
  class Validator

    def allow(*values)
      allowed_values.concat(values)
    end

    def validate!(value)
      raise Invalid.new unless match?(value)
    end

    private

    def allowed_values
      @allowed_values ||= []
    end

    def match?(value)
      allowed_values.any? do |allowed|
        value == allowed
      end
    end
  end
end
