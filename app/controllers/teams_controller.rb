class TeamsController < ApplicationController
  before_action :authenticate_app_user!

  def index
    render json: { teams: [] }
  end

  private

  def authenticate_app_user!
    @current_user = authenticate_with_http_token do |token, options|
      User.find_by_auth_token(token)
    end
    unless @current_user
      render json: { bad: true } and return
    end
  end
end
