module Public
  class OnboardingController < ApplicationController
    before_action :fetch_signup, only: [:confirm_signup, :finalize_signup, :finalized]
    before_action :finalized?, only: [:confirm_signup, :finalize_signup]

    def create_signup
      signup = SignupInteractor::Create.new(
        params: signup_params
      ).call

      return redirect_to confirm_url(email: signup.email) if signup.valid?

      redirect_to home_url
    end

    def confirm
      @email = params[:email]
    end

    def confirm_signup
    end

    def finalize_signup
      # TODO: 
    end

    def finalized
    end

    private

    def signup_params
      params.require(:signup).permit(
        :first_name,
        :last_name,
        :email
      )
    end

    def fetch_signup
      @signup = Signup.find_by_confirmation_token(params[:token])
      return redirect_to home_url unless @signup.present?
    end

    def finalized?
      if @signup.user && @signup.user.confirmed?
        redirect_to :finalized, token: @signup.confirmation_token
      end
    end

    def home_url
      'public/home/index'
    end

    def finalized

    end
  end
end
