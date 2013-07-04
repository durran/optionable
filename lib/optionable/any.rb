# encoding: utf-8
module Optionable
  class Any

    attr_reader :type

    def ==(other)
      other.is_a?(type)
    end

    def initialize(type)
      @type = type
    end
  end
end
