class AuthenticationController < ApplicationController
  def create
    session_creator = UserSession.for(request.format).new(
      params, session, headers
    )
    if session_creator.successful?
      redirect_to team_dashboard_path
    else
      render :new
    end
  end
end

