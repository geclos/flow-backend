require 'active_support/concern'

module Core
  module Exceptions
    module Handler
      extend ActiveSupport::Concern

      included do
        rescue_from Unauthorized do |exception|
          render json: {}, status: 401
        end

        rescue_from ActiveRecord::RecordNotFound do |exception|
          render json: { errors: "Resource ##{params[:id]} not found" }, status: 404
        end

        rescue_from UnprocessableEntity do |exception|
          render json: exception.body, status: 422
        end
      end
    end
  end
end
