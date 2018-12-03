module Public
  class OnboardingController < ApplicationController
    before_action :fetch_signup, only: [:confirm_signup, :finalize_signup, :finalized]
    before_action :redirect_to_finalized?, only: [:confirm_signup, :finalize_signup]

    def create_signup
      signup = SignupInteractor::Create.new(
        params: signup_params.merge(host: ENV['APP_DOMAIN'] || request.host)
      ).call

      return redirect_to confirm_url(email: signup.email) if signup.valid?

      redirect_to root_url
    end

    def confirm
      redirect_to root_url unless Signup.find_by_email params[:email]
      @email = params[:email]
    end

    def confirm_signup
      @company = Company.new
      # TODO: move to config yml
      @sectors = [
        ["Bienes de consumo", "consumer"],
        ["Comercio electrónico", "ecommerce"],
        ["Construcción", "construction"],
        ["Deporte y ocio", "sports_leisure"],
        ["Energía y medio ambiente", "energy"],
        ["Finanzas / seguros", "finance_insurance"],
        ["Logística y transporte", "logistics"],
        ["Marketing", "marketing"],
        ["Salud e industria farmacéutica", "health_farma"],
        ["Tecnologias de la información", "information_technology"],
        ["Turismo", "turism"],
        ["Otros", "other"]
      ]
    end

    def finalize_signup
      interactor = SignupInteractor::Finalize.new(
        signup: @signup,
        company_params: company_params,
        user_params: user_params.merge(
          first_name: @signup.first_name,
          last_name: @signup.last_name,
          email: @signup.email
        )
      )

      interactor.call

      redirect_to finalized_url(token: params[:token])
    end

    def finalized
      if !@signup.user || !@signup.user.confirmed?
        redirect_to :finalized_signup, token: @signup.confirmation_token
      else
        redirect_to ENV['APP_DOMAIN']
      end
    end

    private

    def signup_params
      params.require(:signup).permit(
        :first_name,
        :last_name,
        :email
      )
    end

    def company_params
      params.require(:company).permit(
        :name,
        :country,
        :sector,
        :size
      )
    end

    def user_params
      params.require(:company).permit(:password)
    end

    def fetch_signup
      @signup = Signup.find_by_confirmation_token(params[:token])
      return redirect_to root_url unless @signup.present?
    end

    def redirect_to_finalized?
      if @signup.user && @signup.user.confirmed?
        redirect_to :finalized, token: @signup.confirmation_token
      end
    end
  end
end
