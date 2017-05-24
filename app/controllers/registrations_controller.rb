class RegistrationsController < ApplicationController
  def new
    render locals: {
      registration: Registration.new
    }
  end
end
