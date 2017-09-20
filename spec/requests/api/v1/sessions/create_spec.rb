# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /sign_in" do
  let(:error) { "Error with your login or password" }

  before { post api_sign_in_path, params: auth_params }

  context "when credentials don't match a user" do
    let(:auth_params) { { auth: { email: "foo@bar.com", password: "baz" } } }

    it_behaves_like "a response with an error"
  end

  context "when password is incorrect" do
    let(:auth_params) { { auth: { email: create(:user).email, password: "baz" } } }

    it_behaves_like "a response with an error"
  end

  context "when credentials are valid" do
    include_context "with a regular user"
    let(:auth_params) { { auth: { email: user.email, password: user.password } } }

    it "succeeds" do
      expect(response.status).to eq 200
      expect(json_response[:jwt]).to eq Auth.issue(user: user.id)
    end
  end
end
