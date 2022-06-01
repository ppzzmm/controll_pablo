# frozen_string_literal: true

class Api::V1::FibonacciController < Api::V1::BaseController
  def index
    response_success
  end

  private

  def file_params
    params.require(:fibonacci)
          .permit(
            :index
          )
  end
end
