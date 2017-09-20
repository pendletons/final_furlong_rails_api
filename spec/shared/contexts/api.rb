# frozen_string_literal: true

RSpec.shared_context "with a regular user" do
  let(:user) { create(:user) }
end

RSpec.shared_context "with a logged-in user" do
  let(:jwt) { Auth.issue(user: user.id) }
  let(:headers) { { headers: { "HTTP_AUTHORIZATION" => "Bearer #{jwt}" } } }

  before { get path, headers }
end

RSpec.shared_context "with an admin user" do
  let(:user) { create(:user, :admin) }
end
