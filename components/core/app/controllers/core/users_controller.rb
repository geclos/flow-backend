module Core
  class UsersController < ApplicationController
    before_action :fetch_user, only: [:update, :destroy]

    def index
      result = users.map do |user|
        UserPresenter.new(user).serialize
      end.to_json

      render json: result
    end

    private

    def fetch_user
      @user = users.find_by id: params[:id]
    end

    def users
      UsersCollection.new(current_user).filter
    end

    def raise_model_errors
      raise Exceptions::UnprocessableEntity.new(
        @user.errors.messages
      )
    end
  end
end
