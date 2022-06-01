# frozen_string_literal: true

require 'rails_helper'
require 'json_matchers/rspec'

RSpec.describe Api::V1::FibonacciController, type: :controller do
  render_views

  describe '#index' do
    context 'when the params are correct' do
      it 'returns the value of the index' do
        post :index, format: :json, params: { use_route: 'api/v1/',
                                              fibonacci: { index: 3 }}
        expect(response).to be_successful
      end
    end

    context 'when the params are not correct' do
      it 'returns an error' do
        post :index, format: :json, params: { use_route: 'api/v1/' }
      end
    end
  end
end
