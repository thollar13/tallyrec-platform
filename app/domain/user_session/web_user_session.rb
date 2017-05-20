module UserSession
  class WebUserSession < Base
    def successful?
      if user.valid_password?(password)
        session["user.id"] = user.id
      end
    end

    private

    def user
      User.find_by(email: params[:email]) || NullUser.new
    end

    def password
      params[:password]
    end
  end
end
