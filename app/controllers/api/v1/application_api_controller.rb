class Api::V1::ApplicationApiController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :on_not_found
  # rescue_from ActiveRecord::RecordInvalid, with: :on_validation_error
  # rescue_from StandardError, with: :on_error

  before_action :initialize_payload

  # Gets a JSON object contained in the request body.
  attr_reader :payload

  # Sends a successful response.
  def success(result)
    render json: { success: true, result: result }
  end

  # Sends an unsuccessful response.
  def fail(code, error)
    render json: { success: false, error: error }, status: code
  end

  # Parses request body to JSON and initializes the payload attribute.
  def initialize_payload
    data = request.body.read
    @payload = data.nil? || data.empty? ? {} : JSON.parse(data)
  end

  # def on_not_found
  #   Rails.logger.error(error)
  #   fail(404, 'resource not found')
  # end
  #
  # def on_validation_error
  #   Rails.logger.error(error)
  #   fail(400, 'invalid request')
  # end
  #
  # def on_error
  #   Rails.logger.error(error)
  #   fail(500, 'internal server error')
  # end
end
