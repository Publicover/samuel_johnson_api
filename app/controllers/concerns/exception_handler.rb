module ExceptionHandler
  extend ActiveSupport::Concern

  # define custom error subclasses
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  # define custom handlers
  rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
  rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
  rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
  rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end

  private

  # status 422
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # status 401
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
