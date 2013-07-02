# encoding: utf-8

# @since 0.0.0
module Optionable

  def validate_strict(options)
    (options || {}).each_pair do |key, value|
      validator = optionable_validators[key]
      validator.validate!(value) if validator
    end
  end

  def self.included(klass)
    klass.extend(DSL)
  end

  private

  def optionable_validators
    self.class.optionable_validators
  end

  class Invalid < RuntimeError

  end

  class Validator

    def allows(*values)
      allowed_values.concat(values)
    end

    def validate!(value)
      unless allowed_values.any?{ |allowed| value == allowed }
        raise Invalid.new
      end
    end

    private

    def allowed_values
      @allowed_values ||= []
    end
  end

  module DSL

    def option(key)
      optionable_validators[key] = Validator.new
    end

    def optionable_validators
      @optionable_validators ||= {}
    end
  end
end
