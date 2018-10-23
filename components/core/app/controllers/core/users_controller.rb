module Core
  class UsersController < ApplicationController
    before_action :fetch_user, only: [:update, :destroy]

    def index
      render json: users.map do |user|
        UserPresenter.new(user)
      end.to_json
    end

    def update
      user = UserInteractor::Update.new(
        user: @user,
        params: user_params
      ).call

      render json: UserPresenter.new(user)
    rescue ActiveRecord::RecordInvalid => e
      raise_model_errors
    end

    def delete
      user = UserInteractor::Delete.new(
        user: @user
      ).call

      head :no_content
    rescue ActiveRecord::RecordInvalid => e
      raise_model_errors
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
