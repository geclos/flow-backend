module SignupInteractor
  class Finalize
    attr_accessor :signup, :company, :user

    def initialize(signup:, company_params:, user_params:)
      @signup = signup
      @company = Company.new company_params
      @user = User.new user_params
    end

    def call
      ActiveRecord::Base.transaction do
        company.save!

        user.confirmed_at = Time.now
        user.company = company
        user.save!

        signup.user = user
        signup.save!
      end
    end
  end
end
