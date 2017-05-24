class ApplicationController < ActionController::Base
  # Temp turning this off - CM
  # protect_from_forgery with: :exception

  private

  def authenticate_user!
    @current_user = authenticate_with_http_token do |token, options|
      User.find_by_auth_token(token)
    end
    unless @current_user
      render json: { bad: true } and return
    end
  end
end
