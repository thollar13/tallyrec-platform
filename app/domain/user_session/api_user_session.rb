module UserSession
  class APIUserSession < Base

    def successful?
      user.valid_password?(password)
    end

    def authToken
      AuthTokenGenerator.new(user, headers["HTTP_USER_AGENT"], "api").generate
    end

    def user
      User.find_by(email: params[:email]) || NullUser.new
    end

    def password
      params[:password]
    end
  end
end
