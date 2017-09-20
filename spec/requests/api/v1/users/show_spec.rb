# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /users/:id" do
  include_context "with a regular user"

  let(:path) { api_user_path(id) }
  let(:id) { user.stable_id }

  it_behaves_like "an authenticated request"

  context "when authenticated" do
    include_context "with a logged-in user"

    it_behaves_like "a not found request"
    it_behaves_like "a show request"
  end
end
