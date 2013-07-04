# encoding: utf-8
module Optionable
  module DSL

    def option(key)
      optionable_validators[key] ||= Validator.new
    end

    def optionable_validators
      @optionable_validators ||= {}
    end
  end
end
