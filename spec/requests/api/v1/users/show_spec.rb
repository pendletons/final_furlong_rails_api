# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /users/:id" do
  let(:path) { api_user_path(id) }
  let(:id) { user.id }

  include_context "with a regular user"

  it_behaves_like "an authenticated request"

  context "when authenticated" do
    include_context "with a logged-in user"

    context "when id doesn't match a user" do
      let(:id) { 0 }

      it_behaves_like "a not found request"
    end

    it_behaves_like "a show request"
  end
end
