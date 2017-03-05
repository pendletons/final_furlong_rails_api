require "rails_helper"
require "shared_examples/api_contexts"

RSpec.describe "Logging in" do
  it "does not allow non-existent credentials" do
    login_params = { user_login: { email: "foo@bar.com", password: "baz" } }

    api_post_path("/sign_in", params: login_params)

    expect(response.status).to eq 422
    expect(json_error).to eq "Error with your login or password"
  end

  it "does not allow invalid credentials" do
    user = create(:user)
    login_params = { user_login: { email: user.email, password: "baz" } }

    api_post_path("/sign_in", params: login_params)

    expect(response.status).to eq 422
    expect(json_error).to eq "Error with your login or password"
  end

  it "allows invalid credentials" do
    user = create(:user)
    login_params = { user_login: { email: user.email, password: user.password } }

    api_post_path("/sign_in", params: login_params)

    expect(response.status).to eq 200
    expect(json_response[:auth_token]).to eq user.reload.auth_token
  end
end
