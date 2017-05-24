class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { teams: [] }
  end

  private

end
