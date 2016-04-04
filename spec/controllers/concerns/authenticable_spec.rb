require 'rails_helper'

class Authentication < ActionController::Base
  include Authenticable
end

RSpec.describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      @user = FactoryGirl.create(:user)
      request.headers["Authorization"] = @user.auth_token
      allow(authentication).to receive(:request).and_return(request)
    end

    it "returns the user from the athorization header" do
      expect(authentication.current_user.auth_token).to eql(@user.auth_token)
    end
  end

  controller(ApplicationController) do
    include Authenticable
    before_action :authenticate_with_token!

    def dummy_action
    end
  end

  describe "#authenticate_with_token!" do
    before do
      routes.draw { get 'dummy_action' => 'anonymous#dummy_action' }
      @user = FactoryGirl.create(:user)
      allow(authentication).to receive(:current_user).and_return(nil)
      get :dummy_action
    end

    it "returns error message as JSON" do
      expect(json_response[:errors]).to eql("Not authenticated")
    end

    it "returns a 401 response code" do
      expect(response.status).to eq(401)
    end
  end
end
