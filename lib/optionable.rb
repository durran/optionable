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

  class TypeOf

    attr_reader :type

    def ==(other)
      other.is_a?(type)
    end

    def initialize(type)
      @type = type
    end
  end

  class Validator

    def allows(*values)
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

  module DSL

    def option(key)
      optionable_validators[key] = Validator.new
    end

    def type_of(type)
      TypeOf.new(type)
    end

    def optionable_validators
      @optionable_validators ||= {}
    end
  end
end
