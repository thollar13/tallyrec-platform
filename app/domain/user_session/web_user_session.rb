module UserSession
  class WebUserSession
    def initialize(params, session, headers)
      @params = params
    end

    def successful?
      user.valid_password?(password)
    end

    private

    attr_reader :params

    def user
      User.find_by(email: params[:email]) || NullUser.new
    end

    def password
      params[:password]
    end
  end
end
