require 'rails_helper'

RSpec.describe "Registration" do
  describe "Web" do
    it "should render the registration page for web" do
      get "/registrations/new"

      expect(response.body).to include('Enter New Team Name')
    end
  end
end
