module Public
  class SessionsController < ApplicationController
    def new
      redirect_to ENV['APP_LOCATION'] if current_user
    rescue Core::Exceptions::Unauthorized
      # do nothing (rails will render the login template for us)
    end

    def create
      user = User.authenticate(user_params[:email], user_params[:password])
      if user
        session[:user_id] = user.id
        redirect_to ENV['APP_LOCATION']
      else
        flash.now[:error] = "Invalid email or password"
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      head :no_content
    end

    private

    def user_params
      params.require(:user).permit(
        :email,
        :password
      )
    end
  end
end
