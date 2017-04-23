# frozen_string_literal: true

require "rails_helper"
require "shared_examples/api_contexts"

RSpec.describe "Logging in" do
  context "when credentials don't match a user" do
    it "fails" do
      auth_params = { auth: { email: "foo@bar.com", password: "baz" } }

      api_post_path("/sign_in", params: auth_params)

      expect(response.status).to eq 422
      expect(json_error).to eq "Error with your login or password"
    end
  end

  context "when password is incorrect" do
    it "fails" do
      auth_params = { auth: { email: create(:user).email, password: "baz" } }

      api_post_path("/sign_in", params: auth_params)

      expect(response.status).to eq 422
      expect(json_error).to eq "Error with your login or password"
    end
  end

  context "when credentials are valid" do
    it "succeeds" do
      user = create(:user)
      auth_params = { auth: { email: user.email, password: user.password } }

      api_post_path("/sign_in", params: auth_params)

      expect(response.status).to eq 200
      expect(json_response[:jwt]).to eq Auth.issue(user: user.id)
    end
  end
end
