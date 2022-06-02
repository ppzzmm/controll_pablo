# frozen_string_literal: true

require 'rails_helper'
require 'json_matchers/rspec'

RSpec.describe Api::V1::FibonacciController, type: :controller do
  render_views

  before do
    allow(Fibonacci::Value).to receive(:run)
  end

  describe '#index' do
    context 'when the params are correct' do
      it 'returns the value of the index' do
        result = OpenStruct.new(success?: true, object: 2)
        allow(Fibonacci::Value).to receive(:run).and_return(result)
        post :index, format: :json, params: { use_route: 'api/v1/',
                                              fibonacci: { index: 3 }}
        expect(response).to be_successful
      end
    end

    context 'when the params are not correct' do
      it 'returns an error' do
        result = OpenStruct.new(success?: false, error_message: "error")
        allow(Fibonacci::Value).to receive(:run).and_return(result)
        post :index, format: :json, params: { use_route: 'api/v1/',
                                              fibonacci: { index: "uno" } }
        expect(response).not_to be_successful
      end
    end
  end
end
