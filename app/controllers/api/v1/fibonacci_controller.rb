# frozen_string_literal: true

class Api::V1::FibonacciController < Api::V1::BaseController
  def index
    result = Fibonacci::Value.run(file_params[:index])
    return response_error message: result.error_message unless result.success?

    response_success value: result.object
  end

  private

  def file_params
    params.require(:fibonacci)
          .permit(
            :index
          )
  end
end
