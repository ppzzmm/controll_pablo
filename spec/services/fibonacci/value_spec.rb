# frozen_string_literal: true

require 'rails_helper'

describe Fibonacci::Value do
  describe '#run' do
    context 'when the index is an Integer' do
      it 'returns the index value of the fibonacci sequence' do
        result = described_class.run(3)
        expect(result.success?).to be(true)
        expect(result.object).to eq 2
      end
    end

    context 'when the index is not an integer' do
      it 'returns an error' do
        result = described_class.run("tres")
        expect(result.success?).to be(false)
        expect(result.error_message).to eq('The index is not a Integer type')
      end
    end
  end
end
