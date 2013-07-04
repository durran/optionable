# encoding: utf-8
require "optionable/any"
require "optionable/dsl"
require "optionable/invalid"
require "optionable/validator"
require "optionable/version"

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

  class << self

    def any(type)
      Any.new(type)
    end
  end
end
