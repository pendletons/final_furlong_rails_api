# frozen_string_literal: true
require "rails_helper"
require "shared_examples/api_contexts"

RSpec.describe "Logging out" do
  let(:path) { api_delete_path(path: "/sign_out") }

  it_behaves_like "an authenticated request"

  it "allows valid credentials" do
    user = create(:user_with_auth_token)

    api_delete_path(path: "/sign_out", auth_token: user.auth_token)

    expect(response.status).to eq 200
  end

  it "resets auth token" do
    user = create(:user_with_auth_token)

    api_delete_path(path: "/sign_out", auth_token: user.auth_token)

    expect(user.reload.auth_token).to be_nil
  end
end
