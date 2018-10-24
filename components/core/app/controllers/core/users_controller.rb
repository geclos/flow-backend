module Core
  class UsersController < ApplicationController
    before_action :fetch_user, only: [:update, :destroy]

    def index
      render json: users.map do |user|
        UserPresenter.new(user)
      end.to_json
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
