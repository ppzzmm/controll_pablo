# frozen_string_literal: true

# This class gets the index value of the fibonacci sequence
module Fibonacci
  class Value
    include ErrorHelper

    def initialize(index)
      @index = index
    end

    def self.run(index)
      new(index).run
    end

    def run
      return resolution(false, :is_not_integer) unless is_integer?

      resolution(true, nil, value_of_index(index))
    end

    private

    attr_reader :index

    def value_of_index(number)
      return  number  if number <= 1 
      value_of_index( number - 1 ) + value_of_index(number - 2 )
    end

    def is_integer?
      Integer(index) rescue false
    end

    def errors
      {
        is_not_integer: 'The index is not a Integer type'
      }
    end
  end
end
