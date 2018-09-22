module SignupInteractor
  class Create
    attr_accessor :params, :signup

    def initialize(params:)
      @params = params
      @signup = Signup.new(params)
    end

    def call
      signup.save!
      send_confirmation_email!

      signup
    rescue ActiveRecord::RecordInvalid
      signup
    end

    private

    def send_confirmation_email!
      ::Notifications::SignupNotifier.confirm(signup)
    end
  end
end
