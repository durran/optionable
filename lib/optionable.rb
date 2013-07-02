# encoding: utf-8

# @since 0.0.0
module Optionable

  def validate_strict(options)

  end

  def self.included(klass)
    klass.extend(DSL)
  end

  module DSL

    def option(*keys)

    end
  end
end
